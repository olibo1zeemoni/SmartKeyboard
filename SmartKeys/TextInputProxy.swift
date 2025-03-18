//
//  TextInputProxy.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 12/12/2023.
//

import Foundation
import UIKit

class TextInputProxy: NSObject, UITextDocumentProxy, UITextInputTraits {
    typealias TextInput = UIResponder & UITextInput
    weak var input: TextInput?
    
    init(input: TextInput) {
        self.input = input
        self.autocapitalizationType = input.autocapitalizationType ?? .none
        self.autocorrectionType = input.autocorrectionType ?? .default
        self.enablesReturnKeyAutomatically = input.enablesReturnKeyAutomatically ?? false
        self.isSecureTextEntry = input.isSecureTextEntry ?? false
        self.keyboardAppearance = input.keyboardAppearance ?? .default
        self.keyboardType = input.keyboardType ?? .default
        self.returnKeyType = input.returnKeyType ?? .default
        self.spellCheckingType = input.spellCheckingType ?? .default
        super.init()
    }
    
    var documentContextBeforeInput: String? {
        guard
            let input = input,
            let selectedRange = input.selectedTextRange,
            let rangeBeforeInput = input.textRange(from: input.beginningOfDocument, to: selectedRange.start)
        else { return nil }
        return input.text(in: rangeBeforeInput)
    }
    
    var documentContextAfterInput: String? {
        guard
            let input = input,
            let selectedRange = input.selectedTextRange,
            let rangeAfterInput = input.textRange(from: selectedRange.end, to: input.endOfDocument)
        else { return nil }
        return input.text(in: rangeAfterInput)
    }
    
    var selectedText: String? {
        guard
            let input = input,
            let selectedTextRange = input.selectedTextRange
        else { return nil }
        return input.text(in: selectedTextRange)
    }
    
    var documentInputMode: UITextInputMode? {
        input?.textInputMode
    }
    
    var documentIdentifier: UUID = UUID()
    
    func adjustTextPosition(byCharacterOffset offset: Int) {
        guard
            let input = input,
            let selectedTextRange = input.selectedTextRange,
            let newPosition = input.position(from: selectedTextRange.start, offset: offset)
        else { return }
        input.selectedTextRange = input.textRange(from: newPosition, to: newPosition)
    }
    
    func setMarkedText(_ markedText: String, selectedRange: NSRange) {
        input?.setMarkedText(markedText, selectedRange: selectedRange)
    }
    
    func unmarkText() {
        input?.unmarkText()
    }
    
    var hasText: Bool {
        input?.hasText ?? false
    }
    
    func insertText(_ text: String) {
        input?.insertText(text)
    }
    
    func deleteBackward() {
        input?.deleteBackward()
    }
    
    
    var autocapitalizationType: UITextAutocapitalizationType
    var autocorrectionType: UITextAutocorrectionType
    var enablesReturnKeyAutomatically: Bool
    var keyboardAppearance: UIKeyboardAppearance
    var keyboardType: UIKeyboardType
    var returnKeyType: UIReturnKeyType
    var spellCheckingType: UITextSpellCheckingType
    var isSecureTextEntry: Bool
    
    
}
