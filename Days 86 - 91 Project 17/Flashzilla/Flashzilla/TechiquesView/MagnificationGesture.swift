//
//  MagnificationGesture.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/10/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct MagnificationGestureView: View {
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    
    
    var body: some View {
        Text("Hello, World1")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGestureView()
                    .onChanged({ (amount) in
                        self.currentAmount = amount - 1
                    })
                    .onEnded({ (amount) in
                        self.finalAmount += self.currentAmount
                        self.currentAmount = 0
                    })
        )
    }
}

struct MagnificationGesture_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureView()
    }
}
