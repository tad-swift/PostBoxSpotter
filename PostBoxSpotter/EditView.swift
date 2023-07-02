//
//  EditView.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 15/05/2023.
//


//THIS CAN BE DISREGARDED FOR NOW
























//import SwiftUI
//
//struct EditView: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var image: UIImage = UIImage()
//    @State private var isImagePickerPresented = false
//    var location: Location
//
//    @State private var name: String
//    @State private var description: String
//    
//    
//    var onSave: (Location) -> Void
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
//                    TextField("Place name", text: $name)
//                    TextField("Description", text: $description)
//                    
//                    Image(uiImage: location.uiImage ?? image)
//                        .resizable()
//                        .frame(width: 100, height: 100)
//                    
//                    Button(action: {
//                        isImagePickerPresented = true
//                    }) {
//                        Text("Select Image")
//                            .font(.title)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    .padding(.top, 16)
//                }
//            }
//            .navigationTitle("Place details")
//            .toolbar {
//                Button("Save") {
//                    var newLocation = location
//                    newLocation.id = UUID()
//                    newLocation.name = name
//                    newLocation.description = description
//                    newLocation.base64ImageString = PhotoOperations.imageToBase64String(image)
//                    onSave(newLocation)
//                    dismiss()
//                }
//            }
//            .sheet(isPresented: $isImagePickerPresented) {
//                PhotoPicker(isPresented: $isImagePickerPresented, selectedImage: $image)
//            }
//        }
//    }
//    
//    init(location: Location, onSave: @escaping (Location) -> Void) {
//        self.location = location
//        self.onSave = onSave
//
//        _name = State(initialValue: location.name)
//        _description = State(initialValue: location.description)
//    }
//}
//
//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView(location: Location.example) { newLocation in }
//    }
//}

