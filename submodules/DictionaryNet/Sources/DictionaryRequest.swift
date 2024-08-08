//
//  DictionaryRequest.swift
//  DictionaryNet
//
//  Created by Bing Bing on 2024/8/4.
//

import Foundation
import Alamofire

final class DictionaryRequest {
    private(set) var headers: HTTPHeaders = .init()
    private(set) var parameters: [String: Any] = [:]
    private(set) var method: HTTPMethod = .get
    
    var completed: ((Result<Data?, AFError>) -> Void)?
    
    let path: String
    
    init(path: String) {
        self.path = path
    }
    
    func setHeader(_ h: HTTPHeaders) {
        headers = h
    }
    
    func setHeader(_ h: [String: String]) {
        headers = .init(h)
    }
    
    func setParameter(_ p: [String: Any]) {
        parameters = p
    }
    
    func setMethod(_ m: HTTPMethod) {
        method = m
    }
}

extension Session {
    
    func add(_ r: DictionaryRequest, relativeTo base: URL) async throws -> DataResponse<Data, AFError> {
        guard let url = URL(string: r.path, relativeTo: base) else {
            fatalError("Unable to find url, path: \(r.path) relative to: \(base)")
        }
        let dataTask = self.request(url, method: r.method, parameters: r.parameters, headers: r.headers)
            .serializingResponse(using: .data, automaticallyCancelling: false)
        
        return await dataTask.response
    }
}
