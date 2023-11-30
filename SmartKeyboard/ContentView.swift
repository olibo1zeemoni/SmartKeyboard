//
//  ContentView.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 24/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            TextField("", text: $text)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
