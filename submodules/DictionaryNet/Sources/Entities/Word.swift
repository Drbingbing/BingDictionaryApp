//
//  Word.swift
//  DictionaryNet
//
//  Created by Bing Bing on 2024/8/5.
//

import SwiftyJSON

public struct Word: Hashable, JSONDecodable {
    
    public let word: String
    public let phonetic: String
    public let phonetics: [Phonetic]
    public let meanings: [Meaning]
    public let sourceUrl: [String]
    
    public init(word: String, phonetic: String, phonetics: [Phonetic], meanings: [Meaning], sourceUrl: [String]) {
        self.word = word
        self.phonetic = phonetic
        self.phonetics = phonetics
        self.meanings = meanings
        self.sourceUrl = sourceUrl
    }
    
    static func parse(from json: JSON) -> Word {
        return Word(
            word: json["word"].stringValue,
            phonetic: json["phonetic"].stringValue,
            phonetics: json["phonetic"].arrayValue.map { Phonetic.parse(from: $0) },
            meanings: json["meanings"].arrayValue.map { Meaning.parse(from: $0) },
            sourceUrl: json["sourceUrls"].arrayValue.map(\.stringValue)
        )
    }
}

extension Word {
    
    public struct Phonetic: Hashable, JSONDecodable {
        
        public let text: String
        public let audio: String
        public let sourceUrl: String
        public let license: Licenese
        
        public init(text: String, audio: String, sourceUrl: String, license: Licenese) {
            self.text = text
            self.audio = audio
            self.sourceUrl = sourceUrl
            self.license = license
        }
        
        static func parse(from json: JSON) -> Word.Phonetic {
            return Phonetic(
                text: json["text"].stringValue,
                audio: json["audio"].stringValue,
                sourceUrl: json["sourceUrl"].stringValue,
                license: Licenese.parse(from: json["license"])
            )
        }
    }
}

extension Word {
    
    public struct Meaning: Hashable, JSONDecodable {
        
        public let partOfSpeech: String
        public let definations: [Defination]
        public let synonyms: [String]
        public let antonms: [String]
        
        public init(partOfSpeech: String, definations: [Defination], synonyms: [String], antonms: [String]) {
            self.partOfSpeech = partOfSpeech
            self.definations = definations
            self.synonyms = synonyms
            self.antonms = antonms
        }
        
        static func parse(from json: JSON) -> Word.Meaning {
            return Meaning(
                partOfSpeech: json["partOfSpeech"].stringValue,
                definations: json["definations"].arrayValue.map { Defination.parse(from: $0) },
                synonyms: json["synonyms"].arrayValue.map(\.stringValue),
                antonms: json["antonms"].arrayValue.map(\.stringValue)
            )
        }
    }
}


extension Word.Meaning {
    
    public struct Defination: Hashable, JSONDecodable {
        
        public let defination: String
        public let synonyms: [String]
        public let antonms: [String]
        
        public init(defination: String, synonyms: [String], antonms: [String]) {
            self.defination = defination
            self.synonyms = synonyms
            self.antonms = antonms
        }
        
        static func parse(from json: JSON) -> Word.Meaning.Defination {
            return Defination(
                defination: json["defination"].stringValue,
                synonyms: json["synonyms"].arrayValue.map(\.stringValue),
                antonms: json["antonms"].arrayValue.map(\.stringValue)
            )
        }
    }
}

public struct Licenese: Hashable, JSONDecodable {
    
    public let name: String
    public let url: String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    static func parse(from json: JSON) -> Licenese {
        return Licenese(
            name: json["license"].stringValue,
            url: json["url"].stringValue
        )
    }
}
