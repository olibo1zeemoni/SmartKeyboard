//
//  KeyboardViewController.swift
//  keys
//
//  Created by Olibo moni on 26/11/2023.
//

import UIKit
import SwiftUI

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    let swiftUIView = KeyboardView()
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        //createButton(title: "\u{200E}Hello\u{200F}")

        
        let hostingController = UIHostingController(rootView: swiftUIView)
        //hostingController.sizingOptions = .preferredContentSize
        
        self.addChild(hostingController)

        
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            //hostingController.view.bottomAnchor.constraint(equalTo: nextKeyboardButton.topAnchor),
            //hostingController.view.topAnchor.constraint(equalTo: view.topAnchor) ,
            hostingController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hostingController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        hostingController.didMove(toParent: self)
        
        
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    func createButton(title: String){
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.sizeToFit()
        //button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleInput(sender:)), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    
    @objc func handleInput(sender: UIButton){
        let proxy = self.textDocumentProxy
        
        proxy.insertText(sender.title(for: .normal) ?? "")
        //proxy.insertText(String(rotateText()))
    }
    
    
    func rotateText() -> String {
        let originalCharacter: Character = "K"

        // Get the Unicode scalar value of the original character
        if let unicodeScalar = originalCharacter.unicodeScalars.first {
            // Rotate the Unicode scalar value by 180 degrees
            let rotatedUnicodeScalar = UnicodeScalar(unicodeScalar.value + 998) ?? "K"

            // Create a new character from the rotated Unicode scalar
             let rotatedCharacter = Character(rotatedUnicodeScalar)
             print(rotatedCharacter)
            return "\u{202E}Hello and Welcome \u{202F}"
        }
        return "\u{200F}\u{004B}"
    }
    
    func createButtons(from characters: [String]) -> [UIButton] {
        // Create an empty array of buttons
        var buttons = [UIButton]()
        // Loop over the characters
        for character in characters {
            // Create a button with the character as the title
            let button = UIButton(type: .system)
            button.setTitle(character, for: .normal)
            // Customize the button appearance
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.gray.cgColor
            // Add the button to the array
            buttons.append(button)
        }
        // Return the array of buttons
        return buttons
    }
    
    func keys(_ someEnum: KeysInput) -> [String] {
        var output = [String]()
        for element in  KeysInput.allCases {
            output.append("\(element)")
        }
        return output
    }
    
   
}




struct KeyboardViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> KeyboardViewController {
        // Instantiate your KeyboardViewController here
        return KeyboardViewController()
    }

    func updateUIViewController(_ uiViewController: KeyboardViewController, context: Context) {
        // Update your view controller here
        
    }
}



