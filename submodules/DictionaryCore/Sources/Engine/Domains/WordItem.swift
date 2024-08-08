//
//  WordItem.swift
//  DictionaryCore
//
//  Created by Bing Bing on 2024/8/5.
//

import Foundation
import DictionaryNet

extension Word: DomainTransforable {
    
    func asDomain() -> WordItem {
        return WordItem(
            word: word,
            phonetic: phonetic,
            phonetics: phonetics.map {
                WordItem.PhoneticItem(
                    text: $0.text,
                    audio: $0.audio,
                    sourceUrl: $0.sourceUrl,
                    license: LiceneseItem(
                        name: $0.license.name,
                        url: $0.license.url
                    )
                )
            },
            meanings: meanings.map {
                WordItem.MeaningItem(
                    partOfSpeech: $0.partOfSpeech,
                    definations: $0.definations.map { d in
                        WordItem.DefinationItem(
                            defination: d.defination,
                            synonyms: d.synonyms,
                            antonms: d.antonms
                        )
                    },
                    synonyms: $0.synonyms,
                    antonms: $0.antonms
                )
            },
            sourceUrl: sourceUrl
        )
    }
}

public struct WordItem: Hashable, Sendable {
    
    public let word: String
    public let phonetic: String
    public let phonetics: [PhoneticItem]
    public let meanings: [MeaningItem]
    public let sourceUrl: [String]
    
    public init(word: String, phonetic: String, phonetics: [PhoneticItem], meanings: [MeaningItem], sourceUrl: [String]) {
        self.word = word
        self.phonetic = phonetic
        self.phonetics = phonetics
        self.meanings = meanings
        self.sourceUrl = sourceUrl
    }
    
}

extension WordItem {
    
    public struct PhoneticItem: Hashable, Sendable {
        
        public let text: String
        public let audio: String
        public let sourceUrl: String
        public let license: LiceneseItem
        
        public init(text: String, audio: String, sourceUrl: String, license: LiceneseItem) {
            self.text = text
            self.audio = audio
            self.sourceUrl = sourceUrl
            self.license = license
        }
        
    }
}

extension WordItem {
    
    public struct MeaningItem: Hashable, Sendable {
        
        public let partOfSpeech: String
        public let definations: [DefinationItem]
        public let synonyms: [String]
        public let antonms: [String]
        
        public init(partOfSpeech: String, definations: [DefinationItem], synonyms: [String], antonms: [String]) {
            self.partOfSpeech = partOfSpeech
            self.definations = definations
            self.synonyms = synonyms
            self.antonms = antonms
        }
        
    }
}

extension WordItem {
    
    public struct DefinationItem: Hashable, Sendable {
        public let defination: String
        public let synonyms: [String]
        public let antonms: [String]
        
        public init(defination: String, synonyms: [String], antonms: [String]) {
            self.defination = defination
            self.synonyms = synonyms
            self.antonms = antonms
        }
    }
}

public struct LiceneseItem: Hashable, Sendable {
    
    public let name: String
    public let url: String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
