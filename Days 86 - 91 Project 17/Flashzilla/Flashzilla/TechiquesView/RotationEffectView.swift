//
//  RotationEffectView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/10/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct RotationEffectView: View {
    @State private var currentAmount:  Angle = .degrees(0)
    @State private var finalAmount: Angle = .degrees(0)
    
    
    
    var body: some View {
        Text("Hello, World1")
        .rotationEffect(currentAmount + finalAmount)
        .gesture(
            RotationGesture()
                .onChanged({ (angle) in
                    self.currentAmount = angle
                })
                .onEnded({ (angle) in
                    self.finalAmount += self.currentAmount
                    self.currentAmount = .degrees(0)
                })
        )
        
    }
}

struct RotationEffectView_Previews: PreviewProvider {
    static var previews: some View {
        RotationEffectView()
    }
}
