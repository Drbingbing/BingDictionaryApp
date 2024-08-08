//
//  DomainTransforable.swift
//  DictionaryCore
//
//  Created by Bing Bing on 2024/8/5.
//

import Foundation

protocol DomainTransforable {
    
    associatedtype Domain
    
    func asDomain() -> Domain
}
