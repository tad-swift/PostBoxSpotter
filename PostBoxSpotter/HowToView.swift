//
//  HowToView.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 17/06/2023.
//

import SwiftUI

struct HowToView: View {
    var body: some View {
        NavigationView{
        ZStack{
                Image("HowToBG")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    HStack{
                        NavigationLink("Back"){
                            HomeView()
                        }
                        .frame(width: 130, height: 30)
                        .foregroundColor(Color.white)
                        //.padding()
                        .background(.blue)
                        .clipShape(Capsule())
                        .shadow(radius: 3)
                        .padding(30)
                        
                        NavigationLink("Cyher Guide"){
                            CypherView()
                        }
                        .frame(width: 130, height: 30)
                        .foregroundColor(Color.white)
                        //.padding()
                        .background(.blue)
                        .clipShape(Capsule())
                        .shadow(radius: 3)
                        .padding(30)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
        HowToView()
    }
}
