//
//  PhotoOperations.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 22/05/2023.
//

import Foundation
import UIKit.UIImage

struct PhotoOperations {
    
    private init() {}
    
    static func imageToBase64String(_ input: UIImage) -> String? {
        if let pngRep = input.pngData() {
            let string = pngRep.base64EncodedString()
            return string
        }
        return nil
    }
    
    static func base64ToImage(_ input: String) -> UIImage? {
        if let data = Data(base64Encoded: input) {
            return UIImage(data: data)
        }
        return nil
    }
    
}
