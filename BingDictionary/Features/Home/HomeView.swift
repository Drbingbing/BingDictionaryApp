//
//  HomeView.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            HomeNavigationHeader()
            SizeBoxed(height: 20)
            HomeSearchBar()
            SizeBoxed(height: 20)
            WordSearchResultView()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    HomeView()
}
