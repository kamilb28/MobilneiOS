//
//  LoadImageView.swift
//  ImageRecApp
//
//  Created by kbernacik kbernacik on 26/11/2024.
//

import SwiftUI
import PhotosUI

struct LoadImageView: View {
    @State private var selectedPhotoItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image? = nil
    @State private var processingState: ProcessingState = .idle
    @State private var progress: Double = 0.0
    
    enum ProcessingState: String {
        case idle = "Please select a photo to load it."
        case loaded = "You have loaded a photo."
        case processing = "Recognition in progress..."
        case completed = "Recognition completed."
        case error = "Something went wrong. Try again."
    }
    
    var body: some View {
        NavigationView {
            VStack {
                PhotosPicker(selection: $selectedPhotoItem, matching: .images) {
                    VStack {
                        if let image = selectedImage {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 250)
                                .cornerRadius(10)
                        } else {
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 250)
                                .cornerRadius(10)
                                .overlay(Text("Select a photo").foregroundColor(.blue))
                        }
                    }
                }
                    .onChange(of: selectedPhotoItem) { newItem in
                        loadImage(from: newItem)
                }
                
                Text(processingState.rawValue)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                if processingState == .processing {
                    ProgressView(value: progress)
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding(.horizontal)
                }
                
                Button(action: {
                    runRecognition()
                }) {
                    Text("Run recognition")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(processingState == .idle || selectedImage == nil ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(processingState == .idle || selectedImage == nil)
                .padding(.horizontal)
                
                if selectedImage != nil {
                                    Button(action: {
                                        deleteImage()
                                    }) {
                                        Text("Delete photo")
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(Color.red)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                    .padding(.horizontal)
                                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Select photo")
        }
    }
    
    private func loadImage(from item: PhotosPickerItem?) {
        Task {
            if let newItem = item {
                if let loadedImage = try? await newItem.loadTransferable(type: Image.self) {
                    selectedImage = loadedImage
                    processingState = .loaded
                } else {
                    processingState = .error
                }
            } else {
                selectedImage = nil
                processingState = .idle
            }
        }
    }
    
    private func deleteImage() {
            selectedImage = nil
            selectedPhotoItem = nil
            processingState = .idle
            progress = 0.0
    }
    
    private func runRecognition() {
        guard processingState == .loaded else { return }
        
        processingState = .processing
        progress = 0.0
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if progress < 1.0 {
                progress += 0.05
            } else {
                timer.invalidate()
                processingState = .completed
            }
        }
    }
}

#Preview {
    LoadImageView()
}
