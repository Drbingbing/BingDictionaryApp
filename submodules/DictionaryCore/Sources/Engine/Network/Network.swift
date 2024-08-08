//
//  Network.swift
//  DictonaryCore
//
//  Created by Bing Bing on 2024/8/5.
//

import Foundation
import DictionaryNet

public protocol Network {
    
    func request<T>(_ data: (FunctionDescription, String, DeserializeFunctionResponse<T>)) async throws -> T
}

extension DictionaryNet.Network: Network {}

public func initializeNetwork(accountId: AccountRecordId, loggin: @escaping ((String) -> Void)) -> Network {
#if DEBUG
    return initalizeNetwork(serverConfig: ServerConfigImpl.staging, logging: loggin)
    #else
    return initalizeNetwork(serverConfig: SearchRepositoryImpl.produtcion, logging: loggin)
#endif
    
}
