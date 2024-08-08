//
//  WordResultFeature.swift
//  DictionaryFeatures
//
//  Created by Bing Bing on 2024/8/8.
//

import ComposableArchitecture
import DictionaryCore

@Reducer
public struct WordResultFeature: Sendable {
    
    @ObservableState
    public struct State: Equatable, Sendable {
        
        public let word: WordItem
        public var phonetic: PhoneticFeature.State?
        public var etymology: EtymologyFeature.State?
        
        public init(word: WordItem) {
            self.word = word
        }
    }
    
    @CasePathable
    public enum Action: ViewAction, Sendable {
        case phonetics(PhoneticFeature.Action)
        case etymology(EtymologyFeature.Action)
        case view(View)
        
        public enum View: Sendable {
            case onAppear
        }
    }
    
    public var body: some ReducerOf<WordResultFeature> {
        Reduce { state, action in
            switch action {
            case .view(.onAppear):
                state.phonetic = PhoneticFeature.State(word: state.word.word, phonetics: state.word.phonetics)
                state.etymology = EtymologyFeature.State(meanings: state.word.meanings)
                return .none
            case .etymology:
                return .none
            case .phonetics:
                return .none
            }
        }
    }
    
    public init() {}
}
