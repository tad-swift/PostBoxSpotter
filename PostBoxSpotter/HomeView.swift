//
//  HomeView.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 15/05/2023.
//

//THIS WILL BE THE HOME VIEW, WHEN THE APP OPENS, IT WILL OPEN TO THIS.

//IN PRODUCTION


import SwiftUI

struct HomeView: View {
    @State private var score = 0
    var body: some View {
        NavigationView{
            ZStack{
                Image("PBSBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 10)
                
                Image("HomeViewLogo")
                    .resizable()
                    .frame(width: 400, height: 400)
                    .opacity(0.9)
                    .shadow(radius: 3)
                    //.shadow(radius:7, x: 20, y: 20)
                
                    
                    
                VStack{
                    Spacer()
                    HStack{
                        VStack{
                            HStack{
                                NavigationLink("Scores"){
                                    ScoreView(score: $score)
                                }
                                
                                //.font(Font.headline.weight(.bold))
                                .frame(width: 70, height: 20)
                                .foregroundColor(Color.white)
                                .padding()
                                .background(.blue)
                                .clipShape(Capsule())
                                //.shadow(radius: 3)
                                .padding()
                                
                                NavigationLink("How to"){
                                    HowToView()
                                }
                                
                                //.font(Font.headline.weight(.bold))
                                .frame(width: 70, height: 20)
                                .foregroundColor(Color.white)
                                .padding()
                                .background(.blue)
                                .clipShape(Capsule())
                                //.shadow(radius: 3)
                                .padding()
                            }
                            
                            NavigationLink("Go"){
                                ContentView()
                            }
                            .font(.system(size: 27, weight: .bold))
                            .frame(width: 200, height: 20)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(.green)
                            .clipShape(Capsule())
                            //.shadow(radius: 3)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
