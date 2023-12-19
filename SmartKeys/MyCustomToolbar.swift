//
//  MyCustomToolbar.swift
//  SmartKeys
//
//  Created by Olibo moni on 24/11/2023.
//

import SwiftUI

struct MyCustomToolbar: View {
    @State var mirrorAction: () -> Void
    @State var resetAction: () -> Void

    var body: some View {
        HStack(alignment: .center, spacing: 7) {
            Button(action: resetAction) {
                Spacer()
                Text("Reset")
                Spacer()
            }
            .tint(Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)))
            .buttonStyle(.borderedProminent)
            Divider()
            Button(action: mirrorAction) {
                Spacer()
                Text("Mirror")
                Spacer()
            }
            .tint(Color(#colorLiteral(red: 0, green: 0.7656916718, blue: 0, alpha: 1)))
            .buttonStyle(.borderedProminent)

        }
        .frame(height: 44)
        .padding(.horizontal)
        .background(.clear)
    }
}

#Preview {
    MyCustomToolbar(mirrorAction: { }, resetAction: { })
}
