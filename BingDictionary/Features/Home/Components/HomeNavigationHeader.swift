//
//  HomeNavigationHeader.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI

struct HomeNavigationHeader: View {
    
    var body: some View {
        HStack() {
            Image("book-outlined")
                .asNavigationItem()
            Spacer()
            Menu {
                Picker("theme", selection: .constant("light")) {
                    Text("Dark Mode").tag("dark")
                    Text("Light Mode").tag("light")
                }
            } label: {
                Image("sun-outlined")
                    .asNavigationItem()
            }

        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    HomeNavigationHeader()
        .frame(height: 44)
}
