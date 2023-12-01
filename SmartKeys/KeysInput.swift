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

enum UpperCase: String, CaseIterable {
    case A =  "∀"
    case B =  "𐐒"
    case C =  "Ɔ"
    case D =  "ᗡ"
    case E =  "Ǝ"
    case F =  "Ⅎ"
    case G =  "⅁"
    case H =  "H"
    case I =  "I"
    case J =  "ꓩ"
    case K =  "ꓘ"
    case L =  "˥"
    case M =  "W"
    case N =  "N"
    case O =  "O"
    case P =  "Ԁ"
    case Q =  "Q"
    case R =  "ᴚ"
    case S =  "S"
    case T =  "┴"
    case U =  "ꓵ"
    case V =  "Λ"
    case W =  "M"
    case X =  "X"
    case Y =  "⅄"
    case Z =  "Z"
    //    case 0 =  "0"
    //    case 1 =  "Ɩ"
    //    case 2 =  "ᄅ"
    //    case 3 =  "Ɛ"
    //    case 4 =  "ㄣ"
    //    case 5 =  "ϛ"
    //    case 6 =  "9"
    //    case 7 =  "ㄥ"
    //    case 8 =  "8"
    //    case 9 =  "6"
    
    
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
        "G": "פ",
        "H": "H",
        "I": "I",
        "J": "ſ",
        "K": "ʞ",
        "L": "˥",
        "M": "W",
        "N": "N",
        "O": "O",
        "P": "Ԁ",
        "Q": "Ό",
        "R": "ᴚ",
        "S": "S",
        "T": "⊥",
        "U": "∩",
        "V": "Λ",
        "W": "M",
        "X": "X",
        "Y": "⅄",
        "Z": "Z"
]
