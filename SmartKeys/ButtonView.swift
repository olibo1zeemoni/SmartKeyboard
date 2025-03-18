//
//  ButtonView.swift
//  SmartKeys
//
//  Created by Olibo moni on 28/11/2023.
//

import SwiftUI

struct ButtonView: View {
    let character: Char
    let action: (String) -> Void
    //@Environment(\.verticalSizeClass) var verticalSizeClass

    
    var body: some View {
        Button(action: { action(character.name)} )
        {
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(.buttonBackground)
                Text(NSLocalizedString(character.name, comment: "letter \(character.name)"))
                    .font(.system(size: 25, weight: .light, design: .rounded))
                    .foregroundColor(Color.foreGround)
                    .background(Color.buttonBackground)
            }
        }
    }
}

#Preview {
    ButtonView(character: Char(name: "K", type: .alphabet, isAphanumeric: true), action: { _ in })
}
