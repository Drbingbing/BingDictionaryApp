//
//  DictionaryFeatureTest.swift
//  DictionaryFeatureTest
//
//  Created by Bing Bing on 2024/8/5.
//

import XCTest
import ComposableArchitecture
import DictionaryCore
@testable import DictionaryFeatures

private func helloWordItem() -> WordItem {
    WordItem(
        word: "hello",
        phonetic: "hello",
        phonetics: [
            .init(
                text: "hello",
                audio: "",
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
}

private class AlwaysSuccessSearchRepository: SearchRepository {
    
    func search(word: String) async throws -> DictionaryCore.WordItem {
        return helloWordItem()
    }
}

private class AlwaysFailedSearchRepository: SearchRepository {
    
    struct AnyError: Error {}
    
    func search(word: String) async throws -> WordItem {
        throw AnyError()
    }
}


final class DictionaryFeatureTest: XCTestCase {

    @MainActor
    func test_searchTextChanged() async {
        let store = makeSut()
        
        await store.send(.view(.searchTextChanged("abc"))) {
            $0.searchText = "abc"
        }
        
        await store.receive(\.searchWordResponse.success, timeout: .seconds(1)) {
            $0.wordItem = WordResultFeature.State(word: helloWordItem())
        }
        
        await store.send(.view(.searchTextChanged(""))) {
            $0.searchText = ""
        }
        
        await store.send(.view(.searchTextChanged("hello"))) {
            $0.searchText = "hello"
        }
        
        await store.receive(\.searchWordResponse.success, timeout: .seconds(2))
    }
    
    @MainActor
    func test_shouldCancelSearch_when_searchText_isEmpty() async {
        let store = makeSut()
        
        await store.send(.view(.searchTextChanged("abc"))) {
            $0.searchText = "abc"
        }
        
        await store.receive(\.searchWordResponse.success, timeout: .seconds(1)) {
            $0.searchText = "abc"
            $0.wordItem = WordResultFeature.State(word: helloWordItem())
        }
        
        await store.send(.view(.searchTextChanged(""))) {
            $0.searchText = ""
        }
    }
    
    private func makeSut() -> TestStoreOf<HomeFeature> {
        let sut = DictionaryEngine(searchRepository: AlwaysSuccessSearchRepository())
        
        return TestStore(
            initialState: HomeFeature.State(),
            reducer: { HomeFeature() },
            withDependencies: {
                $0.engine = sut
            }
        )
    }
}
