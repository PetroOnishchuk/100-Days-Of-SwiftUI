//
//  ContentView.swift
//  WorkWithAnimationProject6
//
//  Created by Petro Onishchuk on 1/28/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//


// Days: 32 - 34. Project 6. Part 2. "Controlling the animation stack" Done
import SwiftUI

struct ContentView: View {
    @State private var enabled = false
   
    
    var body: some View {
        Button("Tap Me") {
            self.enabled.toggle()
            }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        //.animation(nil)
        .foregroundColor(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        
            
        }
        
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
