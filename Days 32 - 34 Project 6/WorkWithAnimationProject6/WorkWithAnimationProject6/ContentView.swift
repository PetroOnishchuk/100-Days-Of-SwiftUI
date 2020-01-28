//
//  ContentView.swift
//  WorkWithAnimationProject6
//
//  Created by Petro Onishchuk on 1/28/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//


// Days: 32 - 34. Project 6. Part 1. "Customizing animations in SwiftUI" Done
import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    var body: some View {
        Button("Tap Me") {
            //self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(Color.white)
        .clipShape(Circle())
    .overlay(
        Circle()
            .stroke(Color.red)
        .scaleEffect(animationAmount)
        .opacity(Double(2 - animationAmount))
        .animation(
            Animation.easeOut(duration: 1)
            .repeatForever(autoreverses: false)
            //.repeatCount(3, autoreverses: true)
            //.delay(1)
        )
        )
            .onAppear {
                self.animationAmount = 2
        }
        
        //.animation(.interpolatingSpring(stiffness: 50, damping: 1))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
