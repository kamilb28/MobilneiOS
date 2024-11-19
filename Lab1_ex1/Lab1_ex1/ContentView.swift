//
//  ContentView.swift
//  Lab1_ex1
//
//  Created by kbernacik kbernacik on 19/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("First text")
                .padding()
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 10))
            Text("Hello, world!")
                .padding()
                .background(Color.green, in: RoundedRectangle(cornerRadius: 10))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
