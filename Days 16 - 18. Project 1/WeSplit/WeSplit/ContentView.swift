//
//  ContentView.swift
//  WeSplit
//
//  Created by Petro Onishchuk on 1/16/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        Form {
            Section {
        Text("Hello, World!")
            }
            
            }
        .navigationBarTitle("SwiftUI")
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
