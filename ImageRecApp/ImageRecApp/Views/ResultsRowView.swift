//
//  ResultsRowView.swift
//  ImageRecApp
//
//  Created by kbernacik kbernacik on 26/11/2024.
//

import SwiftUI

struct ResultsRowView: View {
    let objectName: String
    let confidenceLevel: String
    
    var body: some View {
        NavigationLink(destination: DefinitionView(objectName: objectName)) {
            HStack {
                Text(objectName)
                    .font(.headline)
                Spacer()
                Text(confidenceLevel)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 5)
        }
    }
}

#Preview {
    ResultsRowView(objectName: "Object", confidenceLevel: "85%")
}
