//
//  ContentView.swift
//  WorkWithAnimationProject6
//
//  Created by Petro Onishchuk on 1/28/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//


// Days: 32 - 34. Project 6. Part 1. "Creating implicit anomations" Done
import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    var body: some View {
        Button("Tap Me") {
            self.animationAmount += 1
        }
    .padding(50)
        .background(Color.red)
        .foregroundColor(Color.white)
    .clipShape(Circle())
    .scaleEffect(animationAmount)
    .blur(radius: (animationAmount - 1) * 3)
        .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}