//
//  ContentView.swift
//  ImageRecApp
//
//  Created by kbernacik kbernacik on 26/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Load Image", systemImage: "photo") {
                LoadImageView()
            }
            
            Tab("Results", systemImage: "list.bullet") {
                ResultsListView()
            }
            .badge(3)

            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
