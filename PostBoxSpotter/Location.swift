//
//  Location.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 15/05/2023.
//

import MapKit
import Foundation

struct Location: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var description: String
    var selectedCypher: Cypher
    let latitude: Double
    let longitude: Double
    var base64ImageString: String?
    
    var uiImage: UIImage? {
        guard let base64ImageString else { return nil }
        return PhotoOperations.base64ToImage(base64ImageString)
    }
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = Location(id: UUID(), name: "Buckingham Palace", description: "Where Queen Elizabeth lived with her corgis.", selectedCypher: .ERElizabethII, latitude: 51.501, longitude: -0.141, base64ImageString: nil)
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}



