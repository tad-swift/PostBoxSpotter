//
//  ParallaxMotionModifier.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 15/05/2023.
//

import SwiftUI

struct ParallaxMotionModifier: ViewModifier {
    
    @ObservedObject var manager: MotionManager
    var magnitude: Double
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2),
                    radius: 32,
                    //x: -CGFloat(manager.roll * magnitude),
                    y: -CGFloat(manager.pitch * magnitude))
            .offset(//x: CGFloat(manager.roll * magnitude),
                    y: CGFloat(manager.pitch * magnitude))
    }
}
