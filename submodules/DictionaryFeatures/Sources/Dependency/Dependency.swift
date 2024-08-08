//
//  Dependency.swift
//  DictionaryFeatures
//
//  Created by Bing Bing on 2024/8/5.
//
import ComposableArchitecture
import DictionaryCore
import PostBox

private class AlwaysSuccessedSearchRepository: SearchRepository {
    func search(word: String) async throws -> WordItem {
        return WordItem(
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
}

extension DictionaryEngine: DependencyKey {
    public static var liveValue: DictionaryEngine {
        let id = generateAccountRecordId()
        let network = initializeNetwork(accountId: id, loggin: { postboxLog($0) })
        let account = UnauthorizedAccount(id: id, network: network)
        return initializeDictionaryEngine(accountResult: .unauthorized(account))
    }
    
    public static var previewValue: DictionaryEngine {
        return DictionaryEngine(searchRepository: AlwaysSuccessedSearchRepository())
    }
}

extension DependencyValues {
    
    var engine: DictionaryEngine {
        get { self[DictionaryEngine.self] }
        set { self[DictionaryEngine.self] = newValue }
    }
}
