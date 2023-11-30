//
//  ButtonView.swift
//  SmartKeys
//
//  Created by Olibo moni on 28/11/2023.
//

import SwiftUI

struct ButtonView: View {
    let character: String
    let action: () -> Void
    //@Environment(\.verticalSizeClass) var verticalSizeClass

    
    var body: some View {
        Button(action: action)
        {
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(.buttonBackground)
                Text(NSLocalizedString(character, comment: "letter \(character)"))
                    .font(.system(size: 25, weight: .light, design: .rounded))
                    .foregroundColor(Color.foreGround)
                    .background(Color.buttonBackground)
            }
        }
    }
}

#Preview {
    ButtonView(character: "K", action: {})
}
