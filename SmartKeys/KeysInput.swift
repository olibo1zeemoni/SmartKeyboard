//
//  KeysInput.swift
//  SmartKeys
//
//  Created by Olibo moni on 26/11/2023.
//

import Foundation

enum KeysInput: String, CaseIterable {
    case a =  "ɐ"
    case b =  "q"
    case c =  "ɔ"
    case d =  "p"
    case e =  "ǝ"
    case f =  "ɟ"
    case g =  "ƃ"
    case h =  "ɥ"
    case i =  "ᴉ"
    case j =  "ɾ"
    case k =  "ʞ"
    case l =  "l"
    case m =  "ɯ"
    case n =  "u"
    case o =  "o"
    case p =  "d"
    case q =  "b"
    case r =  "ɹ"
    case s =  "s"
    case t =  "ʇ"
    case u =  "n"
    case v =  "ʌ"
    case w =  "ʍ"
    case x =  "x"
    case y =  "ʎ"
    case z =  "z"
    
    static func keys() -> [String] {
        // Use the map function to get the names of the cases
        return Self.allCases.map { "\($0)" }
    }
    
    static func values() -> [String] {
        return Self.allCases.map({ $0.rawValue })
    }
}


var MainDictionary: [Character : String] = [
        "a": "ɐ",
        "b": "q",
        "c": "ɔ",
        "d": "p",
        "e": "ǝ",
        "f": "ɟ",
        "g": "ƃ",
        "h": "ɥ",
        "i": "ᴉ",
        "j": "ɾ",
        "k": "ʞ",
        "l": "l",
        "m": "ɯ",
        "n": "u",
        "o": "o",
        "p": "d",
        "q": "b",
        "r": "ɹ",
        "s": "s",
        "t": "ʇ",
        "u": "n",
        "v": "ʌ",
        "w": "ʍ",
        "x": "x",
        "y": "ʎ",
        "z": "z",
        "A": "∀",
        "B": "𐐒",
        "C": "Ɔ",
        "D": "ᗡ",
        "E": "Ǝ",
        "F": "Ⅎ",
        "G": "⅁",
        "H": "H",
        "I": "I",
        "J": "ſ",
        "K": "ʞ",
        "L": "˥",
        "M": "W",
        "N": "N",
        "O": "O",
        "P": "Ԁ",
        "Q": "ტ",
        "R": "ᴚ",
        "S": "S",
        "T": "⊥",
        "U": "∩",
        "V": "Λ",
        "W": "M",
        "X": "X",
        "Y": "⅄",
        "Z": "Z",
        "0": "0",
        "1": "Ɩ",
        "2": "ᘔ",
        "3": "Ɛ",
        "4": "߈",
        "5": "ဌ",
        "6": "9",
        "7": "ㄥ",
        "8": "8",
        "9": "6"
]
