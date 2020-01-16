//
//  ContentView.swift
//  WeSplit
//
//  Created by Petro Onishchuk on 1/16/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
     @State private var tapCount = 0
    
    var body: some View {
        
        
        Button(action: {
            self.tapCount += 1
        }) {
            Text("Tap Count: \(tapCount)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
