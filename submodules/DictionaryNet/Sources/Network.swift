//
//  Network.swift
//  DictionaryNet
//
//  Created by Bing Bing on 2024/8/4.
//

import Foundation
import Alamofire

public func initalizeNetwork(serverConfig: ServerConfig, logging: ((String) -> Void)? = nil) -> Network {
    return Network(serverConfig: serverConfig, logging: logging)
}

public final class Network {
    
    let session: Session
    let serverConfig: ServerConfig
    let logging: ((String) -> Void)?
    
    init(session: Session? = nil, serverConfig: ServerConfig, logging: ((String) -> Void)? = nil) {
        self.session = session ?? Session.default
        self.serverConfig = serverConfig
        self.logging = logging
    }
    
    public func request<T>(_ data: (FunctionDescription, String, DeserializeFunctionResponse<T>)) async throws -> T {
        let request = DictionaryRequest(path: data.1)
        request.setParameter(data.0.parameters)
        request.setMethod(data.0.method)
        request.setHeader(["Accept": "application/vnd.github+json"])
        
        let response = try await session.add(request, relativeTo: serverConfig.apiURL)
        
        logging?(response.debugDescription)
        do {
            return try data.2.parse(try response.result.get())
        } catch {
            logging?(error.localizedDescription)
            throw error
        }
    }
}
