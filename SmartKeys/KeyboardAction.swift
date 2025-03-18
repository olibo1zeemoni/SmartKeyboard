//
//  KeyboardAction.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 05/12/2023.
//

import Foundation

public enum KeyboardAction: Codable, Equatable {
    
    /// Deletes backwards when pressed, and repeats until released.
    case backspace
    
    /// Inserts a text character when released.
    case character(String)
    
    /// Inserts a text character when released, but is rendered as empty space.
    case characterMargin(String)
    
    /// Represents a command (⌘) key.
    case command
    
    /// Represents a control (⌃) key.
    case control
    
    /// A custom action that you can handle in any way you want.
    case custom(named: String)
    
    /// Represents a dictation key, which are not included by the standard layouts.
    case dictation
    
    /// Dismisses the keyboard when released.
    case dismissKeyboard
    
    
    /// Represents an escape (esc) key.
    case escape
    
    /// Represents a function (fn) key.
    case function
    
    case space
    
    case nextKeyboard
    
    /// Changes the keyboard type to `.alphabetic(.uppercased)` when released and `.capslocked` when double tapped.
    //case shift(currentCasing: Keyboard.Case)
}


extension KeyboardAction {
    typealias GestureAction = (KeyboardController?) -> Void

    var standardPressAction: GestureAction? {
        switch self {
        case .backspace: return { $0?.deleteBackward() }
        case .character(let string):
            return { $0?.insertText(string)}
        default:
            return nil
        }
    }
    
    
    var standardReleaseAction: GestureAction? {
        switch self {
        case .character(let char): return { $0?.insertText(char) }
        case .characterMargin(let char): return { $0?.insertText(char) }
        case .dictation: return { $0?.performDictation() }
        case .dismissKeyboard: return { $0?.dismissKeyboard() }
        case .space: return { $0?.insertText(.space) }
        default:
            return nil 
        }
    }
        
    
    /**
     The action that by default should be triggered when the
     action is triggered with a certain gesture.
     */
    func standardAction(for gesture: Gestures.KeyboardGesture) -> GestureAction? {
        switch gesture {
        //case .doubleTap: return standardDoubleTapAction
        //case .longPress: return standardLongPressAction
        case .press: return standardPressAction
        case .release: return standardReleaseAction
        //case .repeatPress: return standardRepeatAction
        default:
            return nil 
        }
    }
}
