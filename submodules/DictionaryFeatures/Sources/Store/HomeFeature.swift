//
//  HomeFeature.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/5.
//

import ComposableArchitecture
import DictionaryCore

@Reducer
public struct HomeFeature: Sendable {
    
    private enum CancelID { case search }
    
    @Dependency(\.engine) var engine
    
    @ObservableState
    public struct State: Equatable {
        public var searchText: String = ""
        public var wordItem: WordResultFeature.State? = nil
        
        public init() {}
    }
    
    @CasePathable
    public enum Action: Sendable {
        case searchWordResponse(Result<WordItem, Error>)
        case view(View)
        case word(WordResultFeature.Action)
        
        @CasePathable
        public enum View: Sendable {
            case binding(BindingAction<State>)
            case searchTextChanged(String)
        }
    }
    
    public var body: some ReducerOf<HomeFeature> {
        Reduce { state, action in
            switch action {
            case let .view(.searchTextChanged(text)):
                state.searchText = text
                if text.isEmpty {
                    return .cancel(id: CancelID.search)
                }
                return .run { [query = state.searchText] send in
                    await send(
                        .searchWordResponse(
                            Result { try await engine.searchRepository.search(word: query) }
                        )
                    )
                }
                .debounce(id: CancelID.search, for: .milliseconds(500), scheduler: DispatchQueue.main)
            case .view(.binding):
                return .none
            case let .searchWordResponse(.success(word)):
                state.wordItem = WordResultFeature.State(word: word)
                return .none
            case .searchWordResponse(.failure):
                return .none
            case .word:
                return .none
            }
        }
    }
    
    public init() {}
}
