//
//  DictionaryEngine.swift
//  DictionaryCore
//
//  Created by Bing Bing on 2024/8/4.
//

import Foundation

public class DictionaryEngine {
    
    public let searchRepository: SearchRepository
    
    public init<S: SearchRepository>(searchRepository: S) {
        self.searchRepository = searchRepository
    }
}

public func initializeDictionaryEngine(accountResult: AccountResult) -> DictionaryEngine {
    switch accountResult {
    case let .unauthorized(unauthorizedAccount):
        let searchRepository = SearchRepositoryImpl(account: unauthorizedAccount)
        return DictionaryEngine(searchRepository: searchRepository)
    case let .authorized(account):
        let searchRepository = SearchRepositoryImpl(account: account)
        return DictionaryEngine(searchRepository: searchRepository)
    }
}
