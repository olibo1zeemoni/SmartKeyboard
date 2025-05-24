//
//  KeyboardViewController.swift
//  keys
//
//  Created by Olibo moni on 26/11/2023.
//

import UIKit
import SwiftUI
import Combine
#if DEBUG
import Inject
#endif 

class KeyboardViewController: UIInputViewController, KeyboardController {
    #if DEBUG
    @ObserveInjection var inject
    #endif
    
    var previousText = ""
    
    func adjustTextPosition(by characterOffset: Int) {
        
    }
    
    func deleteBackward() {
       textDocumentProxy.deleteBackward()
    }
    
    func deleteBackward(times: Int) {
        
    }
    
    func insertText(_ text: String) {
        textDocumentProxy.insertText(text)
    }
    
    func performAutocomplete() {
        
    }
    
    func performDictation() {
        
    }
    
    func selectNextLocale() {
        
    }
    
    func openUrl(_ url: URL?) {
        
    }
    
    func returnAction(){
        textDocumentProxy.insertText("\u{a}")
    }
    
    func mirrorText() {
        previousText = textDocumentProxy.documentContextBeforeInput ?? ""

        guard textDocumentProxy.hasText else { return }
        
        let textBefore = textDocumentProxy.documentContextBeforeInput ?? ""
        let textAfter = textDocumentProxy.documentContextAfterInput ?? ""
        
        
        while let _ = textDocumentProxy.documentContextBeforeInput {
                textDocumentProxy.deleteBackward()
            }
        
        textDocumentProxy.insertText(flipText(textBefore + textAfter))
    }
    
    func reset() {
        while let _ = textDocumentProxy.documentContextBeforeInput {
            textDocumentProxy.deleteBackward()
        }
        textDocumentProxy.insertText(previousText)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
        // Enable hot reloading
        NotificationCenter.default.addObserver(forName: NSNotification.Name("INJECTION_BUNDLE_NOTIFICATION"), object: nil, queue: nil) { [weak self] _ in
            self?.viewDidLoad()
        }
        #endif
       
        let hostingController = UIHostingController(rootView: KeyboardView(showNextButton: self.needsInputModeSwitchKey, action: { [weak self] char in
            self?.insertText(char)
        }, nextKeyBoardAction: advanceToNextInputMode, mirrorAction: mirrorText, resetAction: reset, spaceAction: { self.insertText(" ")}, deleteAction: deleteBackward, returnAction: returnAction)
            #if DEBUG
            .enableInjection()
            #endif
        )
        hostingController.sizingOptions = .preferredContentSize
        self.addChild(hostingController)
        
        // Remove any existing subviews to avoid constraint conflicts
        view.subviews.forEach { $0.removeFromSuperview() }
        
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a container view to handle the layout
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        // Add the hosting controller's view to the container
        containerView.addSubview(hostingController.view)
        
        // Set up container constraints
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Set up hosting controller view constraints within the container
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
    
    var originalTextDocumentProxy: UITextDocumentProxy {
        super.textDocumentProxy
    }
    
    var textInputProxy: TextInputProxy?
    
    override var textDocumentProxy: UITextDocumentProxy {
        textInputProxy ?? originalTextDocumentProxy
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
        let _ = textDocumentProxy.keyboardType

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
//        guard textDocumentProxy.hasText else { return }
//        var text = textDocumentProxy.documentContextAfterInput!
//        textDocumentProxy.insertText(text)
        
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



