//
//  NewEditView.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 15/05/2023.
//

// THIS CAN BE IGNORED UNTIL CARD VIEW IS DEVELOPED.
import SwiftUI
import CoreMotion

struct NewEditView: View {
    @Environment(\.dismiss) var dismiss
    @State private var image: UIImage = UIImage()
    @State private var isImagePickerPresented = false
    var location: Location
    @State private var motionManager = CMMotionManager()
    @State private var rotationX: CGFloat = 0.0
    @State private var rotationY: CGFloat = 0.0
    let rotationScale: CGFloat = 3.0

    let startingPoint = UnitPoint(x: 0.5, y: 0.5)
    
    @State private var name = "Add name"
    @State private var description = "Add description"
    
    var onSave: (Location) -> Void
    
    //CYPHERS AND SCORING
    
    var cypherSelection = Cypher.allCases
    @State private var selectedCypher: Cypher = .EREdward
    @State private var score = 0
    

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                Image(selectedCypher.imageName)
                    .resizable()
                    .frame(width: 500, height: 500)
                    .rotation3DEffect(
                        Angle(radians: Double(rotationX * rotationScale) / 30),
                        axis: (x: 1.0, y: 0.0, z: 0.0),
                        anchor: startingPoint
                    )
                    .rotation3DEffect(
                        Angle(radians: Double(rotationY * rotationScale) / 30),
                        axis: (x: 0.0, y: 1.0, z: 0.0),
                        anchor: startingPoint
                    )
                    .shadow(radius: 12)
                
                VStack {
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                        .rotation3DEffect(
                            Angle(radians: Double(rotationY * rotationScale) / 40),
                            axis: (x: 0.0, y: 1.0, z: 0.0),
                            anchor: startingPoint
                        )
                        .shadow(radius: 12)
                    
                    Button(action: {
                        isImagePickerPresented = true
                    }) {
                        Image(systemName: "photo.circle")
                            .font(.largeTitle)
                            .padding()
                            .opacity(0.7)
                            .foregroundColor(.gray)
                            .rotation3DEffect(
                                Angle(radians: Double(rotationX * rotationScale) / 30),
                                axis: (x: 1.0, y: 0.0, z: 0.0),
                                anchor: startingPoint
                            )
                            .rotation3DEffect(
                                Angle(radians: Double(rotationY * rotationScale) / 30),
                                axis: (x: 0.0, y: 1.0, z: 0.0),
                                anchor: startingPoint
                            )
                    }
                    .padding()
                    
                    TextField("Place name", text: $name)
                        .foregroundColor(Color.white)
                        .background(Color.clear)
                        .frame(width: 200, height: 25)
                        .multilineTextAlignment(.center)
                    
//                    TextField("Description", text: $description)
//                        .foregroundColor(Color.yellow)
//                        .background(Color.clear)
//                        .frame(width: 200, height: 20)
                    HStack {
                        Text("Select cypher: ")
                            .foregroundColor(.white)
                        Picker("Please choose a cypher", selection: $selectedCypher) {
                            ForEach(cypherSelection, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(.white)
                        .onChange(of: selectedCypher) { newValue in
                            score += newValue.score
                        }
                        
                    }
                    .frame(width: 220)
                    
                    //            Button(action: {
                    //                // Handle trash button action
                    //            }) {
                    //                Image(systemName: "trash")
                    //                    .font(.largeTitle)
                    //                    .foregroundColor(.red)
                    //            }
                    //            .padding(.bottom, 16)
                    
                }
                
            }
            .onAppear {
                startMotionUpdates()
                updateImage()
            }
            .onDisappear {
                stopMotionUpdates()
            }
            .statusBar(hidden: false)
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    newLocation.selectedCypher = selectedCypher
                    newLocation.base64ImageString = PhotoOperations.imageToBase64String(image)
                    onSave(newLocation)
                    dismiss()
                }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                PhotoPicker(isPresented: $isImagePickerPresented, selectedImage: $image)
            }
        }
        
    }
    
    func updateImage() {
        if let locationImage = location.uiImage {
            image = locationImage
        }
    }

    func startMotionUpdates() {
        guard motionManager.isDeviceMotionAvailable else { return }

        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
        motionManager.startDeviceMotionUpdates(to: .main) { (data, error) in
            guard let data = data else { return }

            let rotationRate = data.rotationRate
            let rotationX = CGFloat(rotationRate.x)
            let rotationY = CGFloat(rotationRate.y)

            self.rotationX = self.dampedValue(currentValue: self.rotationX, newValue: rotationX)
            self.rotationY = self.dampedValue(currentValue: self.rotationY, newValue: rotationY)
        }
    }

    func stopMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }

    func dampedValue(currentValue: CGFloat, newValue: CGFloat) -> CGFloat {
        let dampingFactor: CGFloat = 0.1
        return currentValue + (newValue - currentValue) * dampingFactor
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
        _selectedCypher = State(initialValue: location.selectedCypher)
    }
}

struct NewEditView_Previews: PreviewProvider {
    static var previews: some View {
        NewEditView(location: Location.example, onSave: { _ in })
    }
}



