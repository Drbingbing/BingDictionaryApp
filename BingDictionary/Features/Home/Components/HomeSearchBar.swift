//
//  HomeSearchBar.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI

struct HomeSearchBar: View {
    var body: some View {
        HStack {
            TextField("Enter word", text: .constant(""))
            Spacer()
            Image("magnifying-glass-outlined")
                .asSearchBarIcon(.template)
                .foregroundStyle(Color.purple)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background {
            Color.secondary.opacity(0.12)
                .rounded(6)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    HomeSearchBar()
}
