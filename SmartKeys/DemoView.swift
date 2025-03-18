//
//  DemoView.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 28/11/2023.
//

import Foundation
import SwiftUI

struct DemoView: View {
    let rows = [
        ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
        ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
        ["z", "x", "c", "v", "b", "n", "m"]
    ]

    @Environment(\.verticalSizeClass) var verticalSizeClass

    var body: some View {
        VStack {
            if verticalSizeClass == .regular {
                Text("regular")
            } else {
                Text("something else")
            }
            
        }
    }
}



#Preview {
    DemoView()
}
