//
//  SettingsView.swift
//  ImageRecApp
//
//  Created by kbernacik kbernacik on 26/11/2024.
//

import SwiftUI

struct SettingsView: View {
    let genderOptions = ["Woman", "Man", "Other"]
    @State private var selectedGender: String = "Man"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal information")) {
                                    Picker("Sex", selection: $selectedGender) {
                                        ForEach(genderOptions, id: \.self) { gender in
                                            Text(gender)
                                        }
                                    }
                                    .pickerStyle(MenuPickerStyle())
                                }
                Section(header: Text("Other settings")) {
                    Toggle("Option 1", isOn: .constant(true))
                    Toggle("Option 2", isOn: .constant(false))
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
