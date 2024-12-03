//
//  DefinitionView.swift
//  ImageRecApp
//
//  Created by kbernacik kbernacik on 26/11/2024.
//

import SwiftUI

struct DefinitionView: View {
    let objectName: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(objectName)
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.primary)
                    .padding(.bottom, 5)
                
                Text("Detailed Information")
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                Divider()
                
                Text("""
                This is a detailed description of \(objectName). It includes relevant information about the detected object, its characteristics, and possible applications. 
                """)
                    .font(.body)
                    .foregroundColor(.primary)
                    .lineSpacing(5)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Model:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Model 1")
                    }
                    HStack {
                        Text("Confidence Level:")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("95%")
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle(objectName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct DefinitionView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionView(objectName: "Sample Object")
    }
}
