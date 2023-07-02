//
//  CypherView.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 18/06/2023.
//

import SwiftUI

struct CypherView: View {
    
@State private var revealed = false
    var body: some View {
        NavigationView{
            ZStack{
                Image(revealed ? "CypherBGName" : "CypherBG")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack() {
//                    NavigationLink("Back"){
//                        HomeView()
//                    }
//                    .frame(width: 200, height: 20)
//                    .foregroundColor(Color.white)
//                    .padding()
//                    .background(.blue)
//                    .clipShape(Capsule())
//                    .shadow(radius: 3)
//                    .padding(50)
                    Spacer()
                    HStack {
                        //Spacer()
                        //Spacer()
                        Button{
                            revealed.toggle()
                        } label: {
                            Image(systemName: revealed ? "eye.slash" : "eye")
                        }
                        .font(.title)
                        .padding(50)
                        
                    }
                }
            }
        }
    }
}

struct CypherView_Previews: PreviewProvider {
    static var previews: some View {
        CypherView()
    }
}
