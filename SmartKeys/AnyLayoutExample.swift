//
//  AnyLayoutExample.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 28/11/2023.
//

import SwiftUI

struct AnyLayoutExample: View {

    @Environment(\.verticalSizeClass) var verticalSizeClass

    var body: some View {
        let layout = verticalSizeClass == .regular ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout()) 

        layout {
            Image(systemName: "1.circle")
            Image(systemName: "2.circle")
            Image(systemName: "3.circle")
        }
        .font(.largeTitle)
    }
}


#Preview {
    AnyLayoutExample()
}
