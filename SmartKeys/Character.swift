//
//  Character.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 05/12/2023.
//

import Foundation
import SwiftUI


struct Char: Hashable {
    var name: String
    var type: ButtonType
    var isAphanumeric: Bool
    
    var imageName: String?
    
    var image: Image? {
        guard let imageName else { return nil }
          return  Image(systemName: imageName)
        
    }
    
}
