//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Petro Onishchuk on 1/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI


// MARk: CapsuleText View
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            //.foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}


//MARK: Custom modefiers

struct Title: ViewModifier {
    
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
        .padding()
            .background((Color.blue))
        .clipShape(RoundedRectangle(cornerRadius: 10))
            
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
            .padding(5)
                .background(Color.black)
        }
    }
}



struct ContentView: View {
    

    var body: some View {
        VStack {
            Color.blue
            .frame(width: 300, height: 300)
            .watermarked(with: "Hacking with Swift")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// MARK: extension View
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}
