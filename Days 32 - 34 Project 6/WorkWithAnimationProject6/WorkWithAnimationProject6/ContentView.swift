//
//  ContentView.swift
//  WorkWithAnimationProject6
//
//  Created by Petro Onishchuk on 1/28/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//


// Days: 32 - 34. Project 6. Part 2. "Animating gestures" Done
import SwiftUI

struct ContentView: View {
   
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
    .gesture(
        DragGesture()
        .onChanged { self.dragAmount = $0.translation }
            .onEnded{ _ in
                self.dragAmount = .zero
                self.enabled.toggle()
                
        }
        
        )
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
