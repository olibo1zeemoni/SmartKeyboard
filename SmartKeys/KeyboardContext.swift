//
//  KeyboardContext.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 05/12/2023.
//

import Foundation
import SwiftUI
//import UIKit
import Combine

class KeyboardContext: ObservableObject {
    @Published var inputText = ""
    private var cancellables = Set<AnyCancellable>()
    
    /// Whether or not to add an input mode switch key.
    @Published
    public var needsInputModeSwitchKey = false
    
    func addText(_ text: String) {
        inputText += text
    }
    
    init() {
        $inputText
            .sink { text in
                print("Input text: \(text)")
            }
            .store(in: &cancellables)
    }
    
    
}

