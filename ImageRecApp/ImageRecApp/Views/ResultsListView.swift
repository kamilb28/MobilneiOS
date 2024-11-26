//
//  ResultsListView.swift
//  ImageRecApp
//
//  Created by kbernacik kbernacik on 26/11/2024.
//

import SwiftUI

struct ResultsListView: View {
    var body: some View {
        NavigationView {
            List(0..<3) { item in
                NavigationLink(destination: DefinitionView()) {
                    ResultsRowView()
                }
            }
            .navigationTitle("Results")
        }
    }
}

#Preview {
    ResultsListView()
}
