//
//  ContentView.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 24/11/2023.
//

import SwiftUI
#if DEBUG
import Inject
#endif

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
