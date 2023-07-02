//
//  CardView13.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 07/06/2023.
//

//import SwiftUI
//import CoreMotion
//
//struct CardView13: View {
//    @Binding var edited13: Bool
//    
//    @State private var motionManager = CMMotionManager()
//    @State private var rotationX: CGFloat = 0.0
//    @State private var rotationY: CGFloat = 0.0
//    let rotationScale: CGFloat = 3.0
//    @Environment(\.dismiss) var dismiss
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
//                        Button("Save") {
//                            edited13 = true
//                            dismiss()
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
//            .onAppear {
//                startMotionUpdates()
//            }
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
//struct CardView13_Previews: PreviewProvider {
//    @State static private var edited13 = false
//    
//    static var previews: some View {
//        CardView13(edited13: $edited13)
//    }
//}
