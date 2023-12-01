//
//  KeyboardView.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 28/11/2023.
//

import SwiftUI
import UIKit

struct KeyboardView: View {
    let rows = [
        ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
        ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
        ["z", "x", "c", "v", "b", "n", "m"]
    ]
    
    var action: () -> Void
    @Environment(\.verticalSizeClass) var verticalSizeClass
    //@Environment(\.textDocumentProxy) var textDocumentProxy

    
    
    @ViewBuilder
    var body: some View {

        
       // VStack {
                VStack(alignment: .center, spacing: 7) {
                    Spacer()
                    Group {
                        HStack(alignment: .center, spacing: 5) {
                            
                            ForEach(rows[0], id: \.self) { column in
                                ButtonView(character: column.uppercased(), action: action)
                            }
                        }
                        HStack(alignment: .center, spacing: 5) {
                            Spacer(minLength: 12)
                            ForEach(rows[1], id: \.self) { column in
                                ButtonView(character: column.uppercased(), action: action)
                            }
                            Spacer(minLength: 12)
                            
                        }
                        HStack(alignment: .center, spacing: 5) {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                ZStack {
                                    Color.buttonBackground
                                    Image(systemName: "shift.fill")
                                        .font(.system(size: 18, weight: .medium, design: .rounded))
                                }
                                .frame(width: verticalSizeClass == .regular ? 44 : 86,
                                       height: verticalSizeClass == .regular ? 44 : 30)
                                .foregroundColor(Color.foreGround)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                
                            }
                            Spacer()
                            ForEach(rows[2], id: \.self) { column in
                                ButtonView(character: column.uppercased(), action: action)
                            }
                            Spacer()
                            Button(action: {}) {
                                ZStack {
                                    Color.buttonBackground
                                    Image(systemName: "delete.left")
                                        .font(.system(size: 18, weight: .medium, design: .rounded))
                                }
                                .frame(width: verticalSizeClass == .regular ? 44 : 86,
                                       height: verticalSizeClass == .regular ? 44 : 30)
                                .foregroundColor(Color.foreGround)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                
                            }
                        }
                        Group {
                            GeometryReader { proxy in
                                HStackLayout(alignment: .center, spacing: 5){
                                    Button(action: {}) {
                                        ZStack {
                                            Color.buttonBackground
                                            Image(systemName: "textformat.123")
                                        }
                                        .frame(maxWidth: proxy.size.width * 0.12)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                    }
                                    Button(action: {}) {
                                        ZStack {
                                            Color.buttonBackground
                                            Image(systemName: "globe")
                                        }
                                        .frame(maxWidth: proxy.size.width * 0.12)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                    }
                                    Button(action: {}) {
                                        ZStack {
                                            Color.buttonBackground
                                            Text("space")
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                    }
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                        ZStack {
                                            Color.buttonBackground
                                            Text("return")
                                        }
                                        .frame(maxWidth: proxy.size.width * 0.2)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                    }
                                }
                            }
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundStyle(Color.foreGround)
                            .frame(maxWidth: .infinity, minHeight: 30)
                        }
                    }
                    .frame(height: verticalSizeClass == .regular ? 44 : 30)
                    Spacer()
                }
                .font(.system(size: 25, weight: .regular, design: .rounded))
                .padding(.horizontal, 5)
                .background(.keyboardBG)
                .frame(height: verticalSizeClass == .regular ? 210 : 150, alignment: .bottom)
                .safeAreaInset(edge: .top) {
                        Color.green
                            .frame(height: 2)
                    }
               
       // }
    }
}

#Preview {
    KeyboardView(action: {})
}


class KeyboardController1: ObservableObject {
    weak var viewController: UIInputViewController?
    
    func switchToNextKeyboard() {
        viewController?.advanceToNextInputMode()
    }
}
