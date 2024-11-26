//
//  DefinitionView.swift
//  ImageRecApp
//
//  Created by kbernacik kbernacik on 26/11/2024.
//

import SwiftUI

struct DefinitionView: View {
    var body: some View {
        VStack {
            Text("Object Definition")
                .font(.largeTitle)
                .padding()

            Text("Detailed description of the object.")
                .font(.body)
                .padding()
        }
        .navigationTitle("Definition")
    }
}

struct DefinitionView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionView()
    }
}


#Preview {
    DefinitionView()
}
