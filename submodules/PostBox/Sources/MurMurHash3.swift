//
//  MurMurHash3.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import Foundation

func ROTL32(_ x: UInt32, _ r: UInt32) -> UInt32 {
    return (x << r) | (x >> (32 - r))
}

func fmix(_ h: UInt32) -> UInt32 {
    var h = h
    h ^= h >> 16
    h &*= 0x85ebca6b
    h ^= h >> 13
    h &*= 0xc2b2ae35
    h ^= h >> 16
    return h
}

func getblock(_ blocks: UnsafePointer<UInt32>, _ i: Int) -> UInt32 {
    return blocks[i]
}

func murmurhash3_32(key: UnsafePointer<UInt8>, len: Int, seed: UInt32) -> UInt32 {
    let nblocks = len / 4
    
    var h1 = seed
    
    let c1: UInt32 = 0xcc9e2d51
    let c2: UInt32 = 0x1b873593
    
    // Body
    let blocks = key.advanced(by: nblocks * 4).withMemoryRebound(to: UInt32.self, capacity: nblocks) { $0 }
    
    for i in -nblocks..<0 {
        var k1 = getblock(blocks, i)
        
        k1 &*= c1
        k1 = ROTL32(k1, 15)
        k1 &*= c2
        
        h1 ^= k1
        h1 = ROTL32(h1, 13)
        h1 = h1 &* 5 &+ 0xe6546b64
    }
    
    // Tail
    let tail = key.advanced(by: nblocks * 4)
    
    var k1: UInt32 = 0
    
    switch len & 3 {
    case 3:
        k1 ^= UInt32(tail[2]) << 16
        fallthrough
    case 2:
        k1 ^= UInt32(tail[1]) << 8
        fallthrough
    case 1:
        k1 ^= UInt32(tail[0])
        k1 &*= c1
        k1 = ROTL32(k1, 15)
        k1 &*= c2
        h1 ^= k1
    default:
        break
    }
    
    // Finalization
    h1 ^= UInt32(len)
    h1 = fmix(h1)
    
    return h1
}

func murMurHashString32(_ str: String) -> Int32 {
    let seed = UInt32(bitPattern: -137723950)
    let result = murmurhash3_32(key: str, len: strlen(str), seed: seed)
    return Int32(result)
}
