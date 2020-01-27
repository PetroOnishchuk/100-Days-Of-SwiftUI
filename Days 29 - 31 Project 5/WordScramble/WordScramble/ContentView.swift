//
//  ContentView.swift
//  WordScramble
//
//  Created by Petro Onishchuk on 1/27/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI






struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        let input = """
                    a
                    b
                    c
                    """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        
        
        
        return Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
