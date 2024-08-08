//
//  ValueBoxKey.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import Foundation

func mdb_cmp_memn(_ a_memory: UnsafeMutableRawPointer, _ a_length: Int, _ b_memory: UnsafeMutableRawPointer, _ b_length: Int) -> Int {
    var diff: Int = 0
    var len_diff: Int = 0
    var len: Int = 0
    
    len = a_length
    len_diff = a_length - b_length
    if len_diff > 0 {
        len = b_length
        len_diff = 1
    }
    
    diff = Int(memcmp(a_memory, b_memory, len))
    return diff != 0 ? diff : len_diff < 0 ? -1 : len_diff
}
