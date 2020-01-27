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
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelleRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelleRange.location == NSNotFound
        
        
        
        return Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
