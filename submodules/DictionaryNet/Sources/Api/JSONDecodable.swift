//
//  JSONDecodable.swift
//  DictionaryNet
//
//  Created by Bing Bing on 2024/8/5.
//

import SwiftyJSON

protocol JSONDecodable {
    
    static func parse(from json: JSON) -> Self
}
