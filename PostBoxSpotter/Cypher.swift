//
//  Cypher.swift
//  PostBoxSpotter
//
//  Created by Tadreik Campbell on 7/2/23.
//

import Foundation

enum Cypher: String, CaseIterable, Codable {
    
    case CR = "CR"
    case ERElizabethII = "ER (Elizabeth II)"
    case EREdward = "ER (Edward)"
    case GR = "GR"
    case VR = "VR"
    
    var score: Int {
        switch self {
        case .CR: return 1
        case .ERElizabethII: return 2
        case .EREdward: return 3
        case .GR: return 4
        case .VR: return 5
        }
    }
    
    var imageName: String {
        switch self {
        case .CR: return "CRCard"
        case .ERElizabethII: return "ERCard"
        case .EREdward: return "ERCard 2"
        case .GR: return "GRCard"
        case .VR: return "VRCard"
        }
    }
}
