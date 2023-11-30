//
//  AnyLayoutExample.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 28/11/2023.
//

import SwiftUI

struct AnyLayoutExample: View {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        let layout = horizontalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout()) 

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
