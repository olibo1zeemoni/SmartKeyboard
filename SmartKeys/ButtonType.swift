//
//  ButtonType.swift
//  SmartKeys
//
//  Created by Olibo moni on 04/12/2023.
//

import Foundation

enum ButtonType: Hashable, Codable {
    case alphabet
    case space
    case shift
    case delete
    case number(String)
}
