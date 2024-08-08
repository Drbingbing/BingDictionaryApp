//
//  Api.swift
//  DictionaryNet
//
//  Created by Bing Bing on 2024/8/5.
//

import SwiftyJSON

public enum Api {
    public enum functions {
        public enum search {}
    }
}

extension Api {
    
    static func parse<T>(_ t: T.Type, data: Data) throws -> T where T: JSONDecodable {
        let json = try JSON(data: data)
        return t.parse(from: json)
    }
}
