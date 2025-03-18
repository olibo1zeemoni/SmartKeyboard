//
//  File.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 05/12/2023.
//

import Foundation

struct Gestures {
    
    enum KeyboardGesture: String, CaseIterable, Codable, Equatable, Identifiable {

        /// Triggers when a button is double tapped.
        case doubleTap
        
        /// Triggers when a button is pressed down.
        case press

        /// Triggers when a button is released.
        case release
        
        /// Triggers when a button is long pressed.
        case longPress

        /// Triggers repeatedly when a button is pressed & held.
        case repeatPress
        
        /// The gesture's unique identifier.
        var id: String { rawValue }
    }
}
