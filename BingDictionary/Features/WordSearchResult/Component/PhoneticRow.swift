//
//  PhoneticRow.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI
import DictionaryCore
import ComposableArchitecture
import DictionaryFeatures

struct PhoneticRow: View {
    @Bindable var store: StoreOf<PhoneticFeature>
    
    var body: some View {
        VStack {
            HStack {
                Text(store.word)
                    .font(.title.bold())
                    .fontDesign(.rounded)
                Spacer()
            }
            SizeBoxed(height: 12)
            HStack {
                ForEach(0..<store.displayablePhonetics.count, id: \.self) { index in
                    Text(store.displayablePhonetics[index].text)
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

fileprivate extension PhoneticFeature.State {
    
    var displayablePhonetics: [WordItem.PhoneticItem] {
        phonetics.filter {
            !$0.text.isEmpty && !$0.audio.isEmpty
        }
    }
}

#Preview {
    var phonetics: [WordItem.PhoneticItem] = [
        .init(
            text: "/həˈləʊ/",
            audio: "https://api.dictionaryapi.dev/media/pronunciations/en/hello-uk.mp3",
            sourceUrl: "",
            license: .init(
                name: "",
                url: "https://api.dictionaryapi.dev/media/pronunciations/en/hello-au.mp3"
            )
        )
    ]
    
    return PhoneticRow(
        store: Store(
            initialState: PhoneticFeature.State(word: "hello", phonetics: phonetics),
            reducer: { PhoneticFeature() }
        )
    )
}
