//
//  PhoneticFeature.swift
//  DictionaryFeatures
//
//  Created by Bing Bing on 2024/8/8.
//

import ComposableArchitecture
import DictionaryCore

@Reducer
public struct PhoneticFeature: Sendable {
    
    @ObservableState
    public struct State: Equatable, Sendable {
        
        public let phonetics: [WordItem.PhoneticItem]
        public let word: String
        
        public init(word: String, phonetics: [WordItem.PhoneticItem]) {
            self.phonetics = phonetics
            self.word = word
        }
    }
    
    @CasePathable
    public enum Action: Sendable {
        
    }
    
    public var body: some ReducerOf<PhoneticFeature> {
        Reduce { state, action in
            return .none
        }
    }
    
    public init() {}
}
