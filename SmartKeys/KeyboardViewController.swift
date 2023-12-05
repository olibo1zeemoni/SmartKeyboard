//
//  KeyboardViewController.swift
//  keys
//
//  Created by Olibo moni on 26/11/2023.
//

import UIKit
import SwiftUI

class KeyboardViewController: UIInputViewController {
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       /*
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
        
//        hostingController.didMove(toParent: self) */
        self.inputView = MyInputView(frame: .zero, inputViewStyle: .default, action: { self.handleInput() }, nextKeyboardAction: advanceToNextInputMode, showNextButton:  !self.needsInputModeSwitchKey)

        
    }
    
    func newClosure() {
        //var allTouchEvents = UIEvent().allTouches
        //handleInputModeList(from: self.view, with: UIPressesEvent())
        
        advanceToNextInputMode()
    }
    
    override func viewWillLayoutSubviews() {
       // self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
        let keyBoardType = textDocumentProxy.keyboardType

    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    
    @objc func inputCharacter(sender: UIButton) {
        
    }
    
    
    func handleInput(/*sender: UIButton*/){
        let proxy = self.textDocumentProxy
        
       // proxy.insertText(sender.title(for: .normal) ?? "")
        //proxy.insertText(String(rotateText()))
        //right to left override "\u{}
        
        
        proxy.insertText("\u{202E}Hello")
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
    
    func flipText(_ text: String) -> String {
        var flippedText = ""
        
        for char in text {
            // If the character exists in the dictionary, use its upside-down counterpart; otherwise, keep the character unchanged
            flippedText += MainDictionary[char] ?? String(char)
        }
        
        return String(flippedText.reversed())  // Reverse the text to flip it upside down
    }
    

   
}




//struct KeyboardViewControllerPreview: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> KeyboardViewController {
//        // Instantiate your KeyboardViewController here
//        return KeyboardViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: KeyboardViewController, context: Context) {
//        // Update your view controller here
//        
//    }
//}



class MyInputView: UIInputView {
    // Override the init method
    
    init(frame: CGRect, inputViewStyle: UIInputView.Style, action: @escaping () -> Void, nextKeyboardAction: @escaping () -> Void, showNextButton: Bool) {
        // Call the super init method
        
        
        super.init(frame: frame, inputViewStyle: inputViewStyle )
        // Add any subviews or customizations you want
        let swiftUIView = KeyboardView(showNextButton: showNextButton, action: { action() }, nextKeyBoardAction: nextKeyboardAction)
        //self.action = action
        let hostingController = UIHostingController(rootView: swiftUIView)
        //hostingController.sizingOptions = .preferredContentSize
        
        addSubview(hostingController.view)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            hostingController.view.centerXAnchor.constraint(equalTo: centerXAnchor),
            hostingController.view.centerYAnchor.constraint(equalTo: centerYAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
    }
    
    // Required init method
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Define an action for the button
    @objc func buttonTapped() {
        // Get the text document proxy from the input view controller
        
        guard let proxy = inputViewController?.textDocumentProxy else { return }
        // Insert some text at the insertion point
        proxy.insertText("Hello, world!")
    }
}
