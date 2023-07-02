//
//  CardView.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 07/06/2023.
//

//import SwiftUI
//import CoreMotion
//
//struct UserData: Codable {
//    var name: String
//    var description: String
//    var selectedCypher: String
//    var edited: Bool
//}
//
//
//struct CardView: View {
//    @Binding var edited: Bool
//    
//    @State private var motionManager = CMMotionManager()
//    @State private var rotationX: CGFloat = 0.0
//    @State private var rotationY: CGFloat = 0.0
//    let rotationScale: CGFloat = 3.0
//    @Environment(\.dismiss) var dismiss
//    
//    //SAVE TEST
////    @AppStorage("Name") private var name = "Add name"
////    @AppStorage("Description") private var description = "Add description"
////    @AppStorage("SelectedCypher") private var selectedCypher = "Select cypher..."
//// THIS WORKS
//    
//
//    let startingPoint = UnitPoint(x: 0.5, y: 0.5)
//    
//    @State private var name = "Add name"
//    @State private var description = "Add description"
//    
//    var cyphers = ["Select cypher...", "CR", "ER (Elizabeth II)", "ER (Edward)", "GR", "VR"]
//        @State private var selectedCypher = "Select cypher..."
//
//    var body: some View {
//        NavigationView{
//            ZStack {
//                Color.black
//                    .frame(width: 10000, height: 10000)
//                    .edgesIgnoringSafeArea(.all)
//                
//                if selectedCypher == "ER (Elizabeth II)" {
//                    Image("ERCard")
//                        .resizable()
//                        .frame(width: 500, height: 500)
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationX * rotationScale) / 30),
//                            axis: (x: 1.0, y: 0.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationY * rotationScale) / 30),
//                            axis: (x: 0.0, y: 1.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .onAppear {
//                            startMotionUpdates()
//                        }
//                        .onDisappear {
//                            stopMotionUpdates()
//                        }
//                        .shadow(radius: 12)
//                    
//                    //ER CARD END
//                    
//                    //CR CARD START
//                } else if selectedCypher == "CR" {
//                    Image("CRCard")
//                        .resizable()
//                        .frame(width: 500, height: 500)
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationX * rotationScale) / 30),
//                            axis: (x: 1.0, y: 0.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationY * rotationScale) / 30),
//                            axis: (x: 0.0, y: 1.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .onAppear {
//                            startMotionUpdates()
//                        }
//                        .onDisappear {
//                            stopMotionUpdates()
//                        }
//                        .shadow(radius: 12)
//                    
//                    //CR CARD END
//                    
//                    //ER2 CARD START
//                } else if selectedCypher == "ER (Edward)" {
//                    Image("ERCard 2")
//                        .resizable()
//                        .frame(width: 500, height: 500)
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationX * rotationScale) / 30),
//                            axis: (x: 1.0, y: 0.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationY * rotationScale) / 30),
//                            axis: (x: 0.0, y: 1.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .onAppear {
//                            startMotionUpdates()
//                        }
//                        .onDisappear {
//                            stopMotionUpdates()
//                        }
//                        .shadow(radius: 12)
//                    //ER2 CARD END
//                    //GR CARD START
//                } else if selectedCypher == "GR" {
//                    Image("GRCard")
//                        .resizable()
//                        .frame(width: 500, height: 500)
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationX * rotationScale) / 30),
//                            axis: (x: 1.0, y: 0.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationY * rotationScale) / 30),
//                            axis: (x: 0.0, y: 1.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .onAppear {
//                            startMotionUpdates()
//                        }
//                        .onDisappear {
//                            stopMotionUpdates()
//                        }
//                        .shadow(radius: 12)
//                    
//                    //GR CARD END
//                    //VR CARD START
//                } else if selectedCypher == "VR" {
//                    Image("VRCard")
//                        .resizable()
//                        .frame(width: 500, height: 500)
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationX * rotationScale) / 30),
//                            axis: (x: 1.0, y: 0.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationY * rotationScale) / 30),
//                            axis: (x: 0.0, y: 1.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .onAppear {
//                            startMotionUpdates()
//                        }
//                        .onDisappear {
//                            stopMotionUpdates()
//                        }
//                        .shadow(radius: 12)
//                    
//                    //VR CARD END
//                    //Select Cypher card start
//                } else if selectedCypher == "Select cypher..." {
//                    Image("blankCard")
//                        .resizable()
//                        .frame(width: 500, height: 500)
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationX * rotationScale) / 30),
//                            axis: (x: 1.0, y: 0.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationY * rotationScale) / 30),
//                            axis: (x: 0.0, y: 1.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .onAppear {
//                            startMotionUpdates()
//                        }
//                        .onDisappear {
//                            stopMotionUpdates()
//                        }
//                        .shadow(radius: 12)
//                    
//                    //Select Card end
//                    //ER CARD START
//                } else {
//                    Image("ERcard")
//                        .resizable()
//                        .frame(width: 500, height: 500)
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationX * rotationScale) / 30),
//                            axis: (x: 1.0, y: 0.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .rotation3DEffect(
//                            Angle(radians: Double(rotationY * rotationScale) / 30),
//                            axis: (x: 0.0, y: 1.0, z: 0.0),
//                            anchor: startingPoint
//                        )
//                        .onAppear {
//                            startMotionUpdates()
//                        }
//                        .onDisappear {
//                            stopMotionUpdates()
//                        }
//                        .shadow(radius: 12)
//                }
//                    
//                
//                VStack{
//                    
//                    TextField("Place name", text: $name)
//                        .foregroundColor(Color.yellow)
//                        .background(Color.clear)
//                        .frame(width: 200, height: 25)
//                    
//                    
//                    
//                    TextField("Description", text: $description)
//                        .foregroundColor(Color.yellow)
//                        .background(Color.clear)
//                        .frame(width: 200, height: 20)
//                    
//                    
//                    
//                    Picker("Please choose a cypher", selection: $selectedCypher) {
//                        ForEach(cyphers, id: \.self) {
//                            Text($0)
//                                .tint(.yellow)
//                        }
//                    }
//                    .frame(width: 220, alignment: .leading)
//                    .tint(.yellow)
//                    .toolbar{
//                    //FILE MANAGER BUTTON CODE
//                        Button("Save") {
//                            let userData = UserData(name: name, description: description, selectedCypher: selectedCypher, edited: true)
//                            
//                            do {
//                                let encoder = JSONEncoder()
//                                let data = try encoder.encode(userData)
//                                
//                                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//                                let fileURL = documentsDirectory.appendingPathComponent("userData.json")
//                                
//                                try data.write(to: fileURL)
//                                
//                                edited = true
//                                dismiss()
//                            } catch {
//                                print("Error saving user data: \(error)")
//                            }
//                        // FILE MANAGER BUTTON CODE END
//
//                        //Button("Save") {
//                            //UNCOMMENT TO USE USER DEFAULTS FOR SAVING
//                            
////                            UserDefaults.standard.set(name, forKey: "Name")
////                                UserDefaults.standard.set(description, forKey: "Description")
////                                UserDefaults.standard.set(selectedCypher, forKey: "SelectedCypher")
//                            
//                            //edited = true
//                           // dismiss()
//                            
//                        }
//                    }            }
//                
//                .statusBar(hidden: true)
//            }
//            .rotation3DEffect(
//                Angle(radians: Double(rotationX * rotationScale) / 30),
//                axis: (x: 1.0, y: 0.0, z: 0.0),
//                anchor: startingPoint
//            )
//            .rotation3DEffect(
//                Angle(radians: Double(rotationY * rotationScale) / 30),
//                axis: (x: 0.0, y: 1.0, z: 0.0),
//                anchor: startingPoint
//            )
////FILE MANAGER ON APPEAR MODIFIER
//            .onAppear {
//                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//                let fileURL = documentsDirectory.appendingPathComponent("userData.json")
//                
//                do {
//                    let data = try Data(contentsOf: fileURL)
//                    let decoder = JSONDecoder()
//                    let userData = try decoder.decode(UserData.self, from: data)
//                    
//                    name = userData.name
//                    description = userData.description
//                    selectedCypher = userData.selectedCypher
//                    edited = userData.edited
//                    
//                    startMotionUpdates()
//                } catch {
//                    print("Error loading user data: \(error)")
//                }
//            }
////FILE MANAGER ON APEAR MODIFIER END
//            
//            
//// USER DEFAULTS ON APPEAR MODIFIER
////            .onAppear {
////                name = UserDefaults.standard.string(forKey: "Name") ?? "Add name"
////                description = UserDefaults.standard.string(forKey: "Description") ?? "Add description"
////                selectedCypher = UserDefaults.standard.string(forKey: "SelectedCypher") ?? "Select cypher..."
////                startMotionUpdates()
////            }
//// USER DEFAULTS ON APPEAR MODIFIER END
//
//            .onDisappear {
//                stopMotionUpdates()
//            }
//        }
//    }
//    
//
//    func startMotionUpdates() {
//        guard motionManager.isDeviceMotionAvailable else { return }
//
//        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
//        motionManager.startDeviceMotionUpdates(to: .main) { (data, error) in
//            guard let data = data else { return }
//
//            let rotationRate = data.rotationRate
//            let rotationX = CGFloat(rotationRate.x)
//            let rotationY = CGFloat(rotationRate.y)
//
//            self.rotationX = self.dampedValue(currentValue: self.rotationX, newValue: rotationX)
//            self.rotationY = self.dampedValue(currentValue: self.rotationY, newValue: rotationY)
//        }
//    }
//
//    func stopMotionUpdates() {
//        motionManager.stopDeviceMotionUpdates()
//    }
//
//    func dampedValue(currentValue: CGFloat, newValue: CGFloat) -> CGFloat {
//        let dampingFactor: CGFloat = 0.1
//        return currentValue + (newValue - currentValue) * dampingFactor
//    }
//}
//struct CardView_Previews: PreviewProvider {
//    @State static private var edited = false
//    
//    static var previews: some View {
//        CardView(edited: $edited)
//    }
//}
