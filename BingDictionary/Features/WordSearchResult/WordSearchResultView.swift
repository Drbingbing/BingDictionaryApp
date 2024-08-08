//
//  WordSearchResultView.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI
import DictionaryCore
import DictionaryFeatures
import ComposableArchitecture

struct WordSearchResultView: View {
    
    @Bindable var store: StoreOf<WordResultFeature>
    
    init(store: StoreOf<WordResultFeature>) {
        self.store = store
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if let phoneticsStore = store.scope(state: \.phonetic, action: \.phonetics) {
                PhoneticRow(store: phoneticsStore)
                SizeBoxed(height: 20)
            }
            if let etymologyStore = store.scope(state: \.etymology, action: \.etymology) {
                EtymologyRow(store: etymologyStore)
            }
        }
        .onAppear {
            store.send(.view(.onAppear))
        }
    }
}

#Preview {
    var word: WordItem = WordItem(
        word: "hello",
        phonetic: "hello",
        phonetics: [
            .init(
                text: "/həˈləʊ/",
                audio: "https://api.dictionaryapi.dev/media/pronunciations/en/hello-uk.mp3",
                sourceUrl: "",
                license: .init(
                    name: "",
                    url: "https://api.dictionaryapi.dev/media/pronunciations/en/hello-au.mp3"
                )
            )
        ],
        meanings: [
            .init(
                partOfSpeech: "interjection",
                definations: [
                    .init(
                        defination: "A greeting (salutation) said when meeting someone or acknowledging someone’s arrival or presence.",
                        synonyms: [],
                        antonms: []
                    )
                ],
                synonyms: [],
                antonms: ["bye", "goodbye"]
            )
        ],
        sourceUrl: ["https://en.wiktionary.org/wiki/hello"]
    )
    
    
    return WordSearchResultView(
        store: Store(
            initialState: WordResultFeature.State(word: word),
            reducer: { WordResultFeature() }
        )
    )
}
