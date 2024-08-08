//
//  Api_Search.swift
//  DictionaryNet
//
//  Created by Bing Bing on 2024/8/5.
//

import Foundation

extension Api.functions.search {
    
    public static func search(word: String) -> (FunctionDescription, String, DeserializeFunctionResponse<Word>) {
        return (
            FunctionDescription(method: .get, parameters: [:]),
            "/v2/entries/en/\(word)",
            DeserializeFunctionResponse { data -> Word in
                return try Api.parse(Word.self, data: data)
            }
        )
    }
}
