//
//  EtymologyFeature.swift
//  DictionaryFeatures
//
//  Created by Bing Bing on 2024/8/8.
//

import ComposableArchitecture
import DictionaryCore

@Reducer
public struct EtymologyFeature: Sendable {
    
    @ObservableState
    public struct State: Equatable, Sendable {
        
        public let meanings: [WordItem.MeaningItem]
        
        public init(meanings: [WordItem.MeaningItem]) {
            self.meanings = meanings
        }
    }
    
    @CasePathable
    public enum Action: Sendable {
        
    }
    
    public var body: some ReducerOf<EtymologyFeature> {
        Reduce { state, action in
            return .none
        }
    }
    
    public init() {}
}
