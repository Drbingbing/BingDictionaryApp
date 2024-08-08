//
//  AccountRecord.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import Foundation
import PostBox

public protocol AccountRecordAttribute: Codable {
    func isEqual(to: AccountRecordAttribute) -> Bool
}

public struct AccountRecordId: Comparable, Hashable, Codable {
    public let rawValue: Int64
    
    public init(rawValue: Int64) {
        self.rawValue = rawValue
    }
    
    public var int64: Int64 {
        return self.rawValue
    }
    
    public static func ==(lhs: AccountRecordId, rhs: AccountRecordId) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    public static func <(lhs: AccountRecordId, rhs: AccountRecordId) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

public func generateAccountRecordId() -> AccountRecordId {
    var id: Int64 = 0
    arc4random_buf(&id, 8)
    return AccountRecordId(rawValue: id)
}

public final class AccountRecord<Attribute: AccountRecordAttribute>: Equatable, Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case attributes
    }
    
    
    public let id: AccountRecordId
    public let attributes: [Attribute]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let idString = try? container.decode(String.self, forKey: .id), let idValue = Int64(idString) {
            self.id = AccountRecordId(rawValue: idValue)
        } else {
            self.id = try container.decode(AccountRecordId.self, forKey: .id)
        }
        
        if let attributesData = try? container.decode(Array<Data>.self, forKey: .attributes) {
            var attributes: [Attribute] = []
            for data in attributesData {
                if let attribute = try? AdaptedPostboxDecoder().decode(Attribute.self, from: data) {
                    attributes.append(attribute)
                }
            }
            self.attributes = attributes
        } else {
            let attributes = try container.decode([Attribute].self, forKey: .attributes)
            self.attributes = attributes
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(String("\(self.id.rawValue)"), forKey: .id)
        try container.encode(self.attributes, forKey: .attributes)
    }
    
    public init(id: AccountRecordId, attributes: [Attribute]) {
        self.id = id
        self.attributes = attributes
    }
    
    public static func ==(lhs: AccountRecord, rhs: AccountRecord) -> Bool {
        if lhs.id != rhs.id {
            return false
        }
        if lhs.attributes.count != rhs.attributes.count {
            return false
        }
        for i in 0 ..< lhs.attributes.count {
            if !lhs.attributes[i].isEqual(to: rhs.attributes[i]) {
                return false
            }
        }
        return true
    }
}
