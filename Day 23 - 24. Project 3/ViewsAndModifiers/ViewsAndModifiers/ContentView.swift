//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Petro Onishchuk on 1/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userRedText = false
    
    var body: some View {
        Button(action: {
            self.userRedText.toggle()
        }) {
            Text("Hello World")
        }
        .foregroundColor(userRedText ? .red: .blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
