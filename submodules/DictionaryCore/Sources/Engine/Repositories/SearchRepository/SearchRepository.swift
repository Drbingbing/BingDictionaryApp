//
//  SearchRepository.swift
//  DictionaryCore
//
//  Created by Bing Bing on 2024/8/5.
//

import Foundation
import DictionaryNet

public protocol SearchRepository {
    
    func search(word: String) async throws -> WordItem
}

public class SearchRepositoryImpl: SearchRepository {
    
    private let account: Account
    
    public init<A: Account>(account: A) {
        self.account = account
    }
    
    public func search(word: String) async throws -> WordItem {
        return try await _internal_searchWord(account: account, word: word)
    }
}

func _internal_searchWord(account: Account, word: String) async throws -> WordItem {
    let result = try await account.network.request(Api.functions.search.search(word: word))
    return result.asDomain()
}
