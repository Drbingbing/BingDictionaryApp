//
//  RootView.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI
import ComposableArchitecture
import DictionaryFeatures

struct RootView: View {
    var body: some View {
        NavigationStack {
            HomeView(
                store: Store(
                    initialState: HomeFeature.State(),
                    reducer: { HomeFeature() }
                )
            )
        }
    }
}

#Preview {
    RootView()
}
