//
//  ResultsListView.swift
//  ImageRecApp
//
//  Created by kbernacik kbernacik on 26/11/2024.
//

import SwiftUI

struct ResultsListView: View {
    let model1: [(String, String)] = [
        ("Cat", "90%"),
        ("Dog", "80%"),
        ("Hamster", "75%"),
    ]
    
    let model2: [(String, String)] = [
        ("Cat", "60%"),
        ("Dog", "55%"),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Model 1")) {
                    ForEach(model1, id: \.0) { object in
                        ResultsRowView(objectName: object.0, confidenceLevel: object.1)
                    }
                }
                
                Section(header: Text("Model 2")) {
                    ForEach(model2, id: \.0) { object in
                        ResultsRowView(objectName: object.0, confidenceLevel: object.1)
                    }
                }
            }
            .navigationTitle("Results")
        }
    }
}

#Preview {
    ResultsListView()
}
