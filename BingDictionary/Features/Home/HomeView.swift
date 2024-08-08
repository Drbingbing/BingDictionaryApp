//
//  HomeView.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI
import DictionaryFeatures
import ComposableArchitecture

struct HomeView: View {
    @Bindable var store: StoreOf<HomeFeature>
    
    init(store: StoreOf<HomeFeature>) {
        self.store = store
    }
    
    var body: some View {
        ScrollView {
            HomeNavigationHeader()
            SizeBoxed(height: 20)
            HomeSearchBar(
                searchText: .init(
                    get: { store.searchText },
                    set: { store.send(.view(.searchTextChanged($0)), animation: .linear) }
                )
            )
            SizeBoxed(height: 20)
            if let wordStore = store.scope(state: \.wordItem, action: \.word) {
                WordSearchResultView(store: wordStore)
                    .transition(.opacity)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    HomeView(
        store: Store(
            initialState: HomeFeature.State(),
            reducer: { HomeFeature()._printChanges() }
        )
    )
}
