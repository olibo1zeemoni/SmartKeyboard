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
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @EnvironmentObject var keyboardController: KeyboardController
    
    
    @ViewBuilder
    var body: some View {
        //if verti
        
        //GeometryReader { geometry in
        
        VStack(alignment: .center, spacing: 3) {
            Group {
                HStack(alignment: .center, spacing: 5) {
                    
                    ForEach(rows[0], id: \.self) { column in
                        ButtonView(character: column, action: {})
                    }
                }
                HStack(alignment: .center, spacing: 5) {
                    
                    ForEach(rows[1], id: \.self) { column in
                        ButtonView(character: column, action: {})
                    }
                }
                HStack(alignment: .center, spacing: 5) {
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "shift.fill")
                            .frame(maxHeight: .infinity)
                            .foregroundColor(Color.foreGround)
                            .background(Color.buttonBackground)
                            .cornerRadius(5)
                    }
                    ForEach(rows[2], id: \.self) { column in
                        ButtonView(character: column, action: {})
                    }
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "delete.left")
                            .frame(maxHeight: .infinity)
                            .foregroundColor(Color.foreGround)
                            .background(Color.buttonBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    Spacer()
                }
                Group {
                    GeometryReader { proxy in
                        HStackLayout(alignment: .center, spacing: 5){
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                ZStack {
                                    Color.buttonBackground
                                    Image(systemName: "textformat.123")
                                }
                                .frame(maxWidth: proxy.size.width * 0.2)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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
                    .frame(maxWidth: .infinity, minHeight: 44)
                }
            }
            .frame(height: verticalSizeClass == .regular ? 44 : 30)
        }
        .font(.system(size: 25, weight: .regular, design: .rounded))
        .padding(.horizontal, 5)
        //.frame(height: geometry.size.height * 0.4)
        //  }
    }
}

#Preview {
    KeyboardView()
}


class KeyboardController: ObservableObject {
    weak var viewController: UIInputViewController?
    
    func switchToNextKeyboard() {
        viewController?.advanceToNextInputMode()
    }
}
