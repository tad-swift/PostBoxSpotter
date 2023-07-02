//
//  CollectionView.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 15/05/2023.
//

// THIS WILL HOUSE THE COLLECTION OF ALL CARDS THAT WILL BE CREATED BY THE NEW CARD VIEW.

// IN PRODUCTION


//import SwiftUI
//import CoreMotion
//
//struct CollectionView: View {
//    @State private var score = 0
//    @State private var edited = false
//    @State private var edited2 = false
//    @State private var edited3 = false
//    @State private var edited4 = false
//    @State private var edited5 = false
//    @State private var edited6 = false
//    @State private var edited7 = false
//    @State private var edited8 = false
//    @State private var edited9 = false
//    @State private var edited10 = false
//    @State private var edited11 = false
//    @State private var edited12 = false
//    @State private var edited13 = false
//    @State private var edited14 = false
//    @State private var edited15 = false
//    @State private var edited16 = false
//    @State private var edited17 = false
//    @State private var edited18 = false
//    @State private var edited19 = false
//    @State private var edited20 = false
//    @State private var edited21 = false
//    
//    let startingPoint = UnitPoint(x: 0.5, y: 0.5)
//    
//    @State private var motionManager = CMMotionManager()
//    @State private var rotationX: CGFloat = 0.0
//    @State private var rotationY: CGFloat = 0.0
//    let rotationScale: CGFloat = 3.0
//   
//    
//    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
//    
//    var body: some View {
//        NavigationView {
//            ZStack{
//                Color.black
//                    .edgesIgnoringSafeArea(.all)
//                
//                ScrollView {
//                    LazyVGrid(columns: gridItems, spacing: 16) {
//                        Group{
//                            NavigationLink(destination: CardView(edited: $edited)) {
//                                Image(edited ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
////                                    .rotation3DEffect(
////                                        Angle(radians: Double(rotationX * rotationScale) / 30),
////                                        axis: (x: 1.0, y: 0.0, z: 0.0),
////                                        anchor: startingPoint
////                                    )
////                                    .rotation3DEffect(
////                                        Angle(radians: Double(rotationY * rotationScale) / 30),
////                                        axis: (x: 0.0, y: 1.0, z: 0.0),
////                                        anchor: startingPoint
////                                    )
////                                    .onAppear {
////                                        startMotionUpdates()
////                                    }
////                                    .onDisappear {
////                                        stopMotionUpdates()
////                                    }
//                                
//                            }
//                            
//                            NavigationLink(destination: CardView2(edited2: $edited2)) {
//                                Image(edited2 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView3(edited3: $edited3)) {
//                                Image(edited3 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView4(edited4: $edited4)) {
//                                Image(edited4 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                        }
//                        Group{
//                            NavigationLink(destination: CardView5(edited5: $edited5)) {
//                                Image(edited5 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView6(edited6: $edited6)) {
//                                Image(edited6 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView7(edited7: $edited7)) {
//                                Image(edited7 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView8(edited8: $edited8)) {
//                                Image(edited8 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView9(edited9: $edited9)) {
//                                Image(edited9 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView10(edited10: $edited10)) {
//                                Image(edited10 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView11(edited11: $edited11)) {
//                                Image(edited11 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView12(edited12: $edited12)) {
//                                Image(edited12 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                        }
//                        Group{
//                            NavigationLink(destination: CardView13(edited13: $edited13)) {
//                                Image(edited13 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView14(edited14: $edited14)) {
//                                Image(edited14 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView15(edited15: $edited15)) {
//                                Image(edited15 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView16(edited16: $edited16)) {
//                                Image(edited16 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView17(edited17: $edited17)) {
//                                Image(edited17 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView18(edited18: $edited18)) {
//                                Image(edited18 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                            NavigationLink(destination: CardView19(edited19: $edited19)) {
//                                Image(edited19 ? "blankCard" : "PlaceholderIMG")
//                                    .resizable()
//                                    .frame(width: 90, height: 90)
//                            }
//                        }
//                        NavigationLink(destination: CardView20(edited20: $edited20)) {
//                            Image(edited20 ? "blankCard" : "PlaceholderIMG")
//                                .resizable()
//                                .frame(width: 90, height: 90)
//                        }
//                        NavigationLink(destination: CardView21(edited21: $edited21)) {
//                            Image(edited21 ? "blankCard" : "PlaceholderIMG")
//                                .resizable()
//                                .frame(width: 90, height: 90)
//                        }
//                    }
//                    .padding()
//                }
//                //.navigationTitle("Collection")
//            }
//        }
//        .onAppear {
//            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//            let fileURL = documentsDirectory.appendingPathComponent("userData.json")
//            
//            do {
//                let data = try Data(contentsOf: fileURL)
//                let decoder = JSONDecoder()
//                let userData = try decoder.decode(UserData.self, from: data)
//                
////                name = userData.name
////                description = userData.description
////                selectedCypher = userData.selectedCypher
//                edited = userData.edited
//               // edited2 = userData.edited2
//                
//                
//                //startMotionUpdates()
//            } catch {
//                print("Error loading user data: \(error)")
//            }
//        }
//    }
//    
//    //UNCOMMENT THIS IF YOU WANT ALL THE LITTLE CARDS TO MOVE
//    
////    func startMotionUpdates() {
////        guard motionManager.isDeviceMotionAvailable else { return }
////
////        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
////        motionManager.startDeviceMotionUpdates(to: .main) { (data, error) in
////            guard let data = data else { return }
////
////            let rotationRate = data.rotationRate
////            let rotationX = CGFloat(rotationRate.x)
////            let rotationY = CGFloat(rotationRate.y)
////
////            self.rotationX = self.dampedValue(currentValue: self.rotationX, newValue: rotationX)
////            self.rotationY = self.dampedValue(currentValue: self.rotationY, newValue: rotationY)
////        }
////    }
////
////    func stopMotionUpdates() {
////        motionManager.stopDeviceMotionUpdates()
////    }
////
////    func dampedValue(currentValue: CGFloat, newValue: CGFloat) -> CGFloat {
////        let dampingFactor: CGFloat = 0.1
////        return currentValue + (newValue - currentValue) * dampingFactor
////    }
//}
//
//struct CollectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionView()
//    }
//}
