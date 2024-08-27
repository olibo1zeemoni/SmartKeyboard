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
    
    @State var switchCase: Bool = false
    @State var showNextButton: Bool = false
    @State var action: (String) -> Void
    var nextKeyBoardAction: () -> Void
    @State var mirrorAction: () -> Void
    @State var resetAction: () -> Void
    @State var spaceAction: () -> Void
    @State var deleteAction: () -> Void
    @State var returnAction: () -> Void
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    
    
    
    
    @ViewBuilder
    var body: some View {

        
        VStack(spacing: 0) {
            MyCustomToolbar(mirrorAction: mirrorAction, resetAction: resetAction)
            VStack(alignment: .center, spacing: 7) {
                        //Spacer()
                        Group {
                            HStack(alignment: .center, spacing: 5) {
                                
                                ForEach(inputKeys[0], id: \.name) { column in
                                    ButtonView(character: Char(name: column.name, type: .alphabet, isAphanumeric: true), action: action)
                                }
                            }
                            HStack(alignment: .center, spacing: 5) {
                                Spacer(minLength: 12)
                                ForEach(inputKeys[1], id: \.name) { column in
                                    ButtonView(character: Char(name: column.name, type: .alphabet, isAphanumeric: true), action: action)
                                }
                                Spacer(minLength: 12)
                                
                            }
                            HStack(alignment: .center, spacing: 5) {
                                Button(action: { switchCase.toggle()}) {
                                    ZStack {
                                        Color.buttonBackground
                                        Image(systemName: switchCase ? "shift" : "shift.fill")
                                            .font(.system(size: 18, weight: .medium, design: .rounded))
                                    }
                                    .frame(width: verticalSizeClass == .regular ? 44 : 86,
                                           height: verticalSizeClass == .regular ? 44 : 30)
                                    .foregroundColor(Color.foreGround)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    
                                }
                                Spacer()
                                ForEach(inputKeys[2], id: \.name) { column in
                                    ButtonView(character: Char(name: column.name, type: .alphabet, isAphanumeric: true), action: action)
                                }
                                Spacer()
                                Button(action: deleteAction) {
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
                                        Button(action: { }) {
                                            ZStack {
                                                Color.buttonBackground
                                                Image(systemName: "textformat.123")
                                            }
                                            .frame(maxWidth: proxy.size.width * 0.12)
                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                                        }
                                        if showNextButton {
                                            Button(action: {nextKeyBoardAction()}) {
                                                ZStack {
                                                    Color.buttonBackground
                                                    Image(systemName: "globe")
                                                }
                                                .frame(maxWidth: proxy.size.width * 0.12)
                                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                            }
                                        }
                                        Button(action: spaceAction) {
                                            ZStack {
                                                Color.buttonBackground
                                                Text("space")
                                            }
                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                                        }
                                        Button(action: returnAction) {
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
                      //  Spacer()
                    }
                    .font(.system(size: 25, weight: .regular, design: .rounded))
                    .padding(.horizontal, 5)
                    .frame(height: verticalSizeClass == .regular ? 210 : 150, alignment: .bottom)
        }
        .background(.keyboardBG)
        //.safeAreaInset(edge: .top) { Color.green.frame(height: 2) }

               
    }
    
    var inputKeys: [[Char]] {
        var array: [[Char]] = []
        var temp: [Char] = []
        for row in rows {
            for column in row {
                let char = Char(name: switchCase ? column : column.uppercased(), type: .alphabet, isAphanumeric: false)
                temp.append(char)
            }
            array.append(temp)
            temp.removeAll()
        }
        return array
    }
    
}

#Preview {
    KeyboardView(action: { _ in }, nextKeyBoardAction: { }, mirrorAction: {}, resetAction: {}, spaceAction: {}, deleteAction: {}, returnAction: {})
}


//class KeyboardController1: ObservableObject {
//    weak var viewController: UIInputViewController?
//    
//    func switchToNextKeyboard() {
//        viewController?.advanceToNextInputMode()
//    }
//}
