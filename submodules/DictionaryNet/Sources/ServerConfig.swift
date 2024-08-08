//
//  ServerConfig.swift
//  DictionaryNet
//
//  Created by Bing Bing on 2024/8/4.
//

import Foundation

public protocol ServerConfig {
    var apiURL: URL { get }
}

public func == (lhs: ServerConfig, rhs: ServerConfig) -> Bool {
  return
    type(of: lhs) == type(of: rhs) &&
    lhs.apiURL == rhs.apiURL
}

public struct ServerConfigImpl: ServerConfig {
    
    public var apiURL: URL
    
    init(apiURL: URL) {
        self.apiURL = apiURL
    }
    
    public static let staging: ServerConfig = ServerConfigImpl(
        apiURL: URL(string: "https://api.dictionaryapi.dev/api")!
    )
    
    public static let produtcion: ServerConfig = ServerConfigImpl(
        apiURL: URL(string: "https://api.dictionaryapi.dev/api")!
    )
}
