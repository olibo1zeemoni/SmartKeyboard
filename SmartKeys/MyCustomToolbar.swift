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
//            .frame(maxWidth: .infinity, alignment: .leading)
            .buttonStyle(.borderedProminent)
            Divider()
            Button(action: mirrorAction) {
                Spacer()
                Text("Mirror")
                Spacer()
            }
//            .frame(maxWidth: .infinity, alignment: .trailing)

            .tint(.purple)
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
