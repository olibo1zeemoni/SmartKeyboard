//
//  KeyboardController.swift
//  SmartKeys
//
//  Created by Olibo moni on 29/11/2023.
//

import Foundation

public protocol KeyboardController: AnyObject {

    /// Adjust the text input cursor position.
    func adjustTextPosition(by characterOffset: Int)

    /// Delete backwards.
    func deleteBackward()

    /// Delete backwards a certain number of times.
    func deleteBackward(times: Int)

    /// Dismiss the keyboard.
    func dismissKeyboard()

    /// Insert the provided text.
    func insertText(_ text: String)

    /// Perform an autocomplete operation.
    func performAutocomplete()

    /// Perform a keyboard-initiated dictation operation.
    func performDictation()

    /// Select the next locale, if any.
    func selectNextLocale()


    /// Open a certain URL
    func openUrl(_ url: URL?)
}
