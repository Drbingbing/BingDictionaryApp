//
//  PhoneticRow.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI

struct PhoneticRow: View {
    var body: some View {
        VStack {
            HStack {
                Text("hello")
                    .font(.title.bold())
                    .fontDesign(.rounded)
                Spacer()
            }
            SizeBoxed(height: 12)
            HStack {
                ForEach(0..<2) { index in
                    Text("/həˈləʊ/")
                        .fontDesign(.rounded)
                        .foregroundStyle(.purple)
                    Image("speaker-outlined")
                        .asSearchBarIcon(.template)
                        .foregroundStyle(.purple)
                    SizeBoxed(width: 20)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    PhoneticRow()
}
