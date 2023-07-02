//
//  ScoreView.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 26/06/2023.
//

//IN PRODUCTION


import SwiftUI

struct ScoreView: View {
    @Binding var score: Int
    
    var body: some View {
        Text(getScore())
    }
    
    func getScore() -> String {
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        if let data = try? Data(contentsOf: savePath),
            let locations = try? JSONDecoder().decode([Location].self, from: data) {
            let score = locations.map(\.selectedCypher.score).reduce(0, +)
            return String(score)
        }
        return "No score yet"
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: .constant(0))
    }
}
