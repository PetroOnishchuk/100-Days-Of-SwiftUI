//
//  ContentView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/9/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @State private var cards = [Card](repeating: Card.example, count: 10)
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in CardView(card: self.cards[index]) {
                        withAnimation {
                            self.removeCard(at: index)
                        }
                    }
                    .stacked(at: index, in: self.cards.count)
                        
                    }
                }
            }
            if !differentiateWithoutColor {
               
                VStack {
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "checkmark.circle")
                            .padding()
                            .background(Color.red.opacity(0.7))
                            .clipShape(Circle())
                       Spacer()
                        Image(systemName: "checkmark.circle")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
