//
//  ContentView.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 24/11/2023.
//

import SwiftUI
import Inject

struct ContentView: View {
    @ObserveInjection var inject
    @State var text = ""
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                Text("Smart Keyboard")
            }
            TextField("", text: $text)
        }
        .padding()
        .enableInjection()
    }
}

#Preview {
    ContentView()
}
