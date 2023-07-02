//
//  PhotoPicker.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 22/05/2023.
//

import UIKit
import SwiftUI
import PhotosUI

struct PhotoView: View {
    @State private var image: UIImage = UIImage()
    @State private var isImagePickerPresented = false
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .aspectRatio(contentMode: .fit)
            
            Button(action: {
                isImagePickerPresented = true
            }) {
                Text("Select Image")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 16)
        }
        .sheet(isPresented: $isImagePickerPresented) {
            PhotoPicker(isPresented: $isImagePickerPresented, selectedImage: $image)
        }
    }
}

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if let itemProvider = results.first?.itemProvider,
               itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { image, _ in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            self.parent.selectedImage = image
                        }
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.parent.isPresented = false
            }
        }
    }
}
