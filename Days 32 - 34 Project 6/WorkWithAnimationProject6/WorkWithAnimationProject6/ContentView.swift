//
//  ContentView.swift
//  WorkWithAnimationProject6
//
//  Created by Petro Onishchuk on 1/28/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//


// Days: 32 - 34. Project 6. Part 1. "Creating explicit animations" Done
import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
   
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
            
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
