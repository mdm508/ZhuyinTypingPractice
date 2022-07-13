//
//  Symbol.swift
//  ZhuyinTypingPractice
//
//  Created by Matthew on 7/12/22.
//

import Foundation

struct Syllable {
    private let syllable: String
    //TODO: Make this type agree with type needed by Random generator
        /// Per million Chinese characters, how often does this symbol appear
    private let frequency: Double
    init(_ syllable: String, frequency: Double){
        self.syllable = syllable
        self.frequency = frequency
    }

}


struct Zhuyin {
        /// The Zhuyin Symbol
    private let symbol: String
        /// List of syllables that start with symbol
    private var syllables: [Syllable]
    init(_ symbol: String, _ syllables: [Syllable]){
        self.symbol = symbol
        self.syllables = syllables
    }
}

let b = Zhuyin("ㄅ", [
    Syllable("ㄅㄚ",frequency: 2359),
    Syllable("ㄅㄛ", frequency: 1429),
    Syllable("ㄅㄞ ", frequency: 1128),
    Syllable("ㄅㄟ", frequency: 4395),
    Syllable("ㄅㄠ", frequency: 4966),
    Syllable("ㄅㄢ", frequency: 4279),
    Syllable("ㄅㄣ", frequency: 3460),
    Syllable("ㄅㄤ", frequency: 621),
    Syllable("ㄅㄥ", frequency: 42),
    Syllable("ㄅㄧ", frequency: 2816),
    Syllable("ㄅㄧㄝ", frequency: 1120),
    Syllable("ㄅㄧㄠ", frequency: 3395),
    Syllable("ㄅㄧㄢ", frequency: 2338),
    Syllable("ㄅㄧㄣ", frequency: 257),
    Syllable("ㄅㄧㄥ", frequency: 2298),
    Syllable("ㄅㄨ", frequency: 7293)
])
