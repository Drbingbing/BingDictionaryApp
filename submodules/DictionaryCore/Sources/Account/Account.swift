//
//  Account.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import Foundation

public protocol Account {
    var id: AccountRecordId { get }
    var network: Network { get }
}

public final class UnauthorizedAccount: Account {
    
    public let id: AccountRecordId
    public let network: Network
    
    public init<N: Network>(id: AccountRecordId, network: N) {
        self.id = id
        self.network = network
    }
}

public final class AuthorizedAccount: Account {
    
    public let id: AccountRecordId
    public let network: Network
    
    public init<N: Network>(id: AccountRecordId, network: N) {
        self.id = id
        self.network = network
    }
}

public enum AccountResult {
    case unauthorized(UnauthorizedAccount)
    case authorized(AuthorizedAccount)
}
