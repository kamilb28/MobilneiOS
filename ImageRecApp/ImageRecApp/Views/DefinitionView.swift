//
//  DefinitionView.swift
//  ImageRecApp
//
//  Created by kbernacik kbernacik on 26/11/2024.
//

import SwiftUI
import Alamofire

struct DefinitionView: View {
    let objectName: String
    @State private var definitions: [Definition] = []
    @State private var isLoading = true
    @State private var errorMessage: String? = nil
    
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
                
                if isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else if let errorMessage = errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    ForEach(definitions, id: \.definition) { definition in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(definition.definition)
                                .font(.body)
                            
                            if let example = definition.example {
                                Text("Example: \(example)")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                }
                
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
        .onAppear {
            fetchDefinition(for: objectName)
        }
    }
    
    private func fetchDefinition(for word: String) {
            let url = "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)"
            
            AF.request(url).responseDecodable(of: [DictionaryEntry].self) { response in
                switch response.result {
                case .success(let entries):
                    for entry in entries {
                        for meaning in entry.meanings {
                            if let firstDefinition = meaning.definitions.first {
                                self.definitions = [Definition(
                                    definition: firstDefinition.definition,
                                    example: firstDefinition.example)]
                                self.isLoading = false
                                return
                            }
                        }
                    }
                case .failure(let error):
                    errorMessage = error.localizedDescription
                }
                isLoading = false
            }
        }
}
struct DefinitionView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionView(objectName: "cat")
    }
}
