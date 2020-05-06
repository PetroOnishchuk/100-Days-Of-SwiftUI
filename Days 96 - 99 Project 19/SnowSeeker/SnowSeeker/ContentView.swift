//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Petro Onishchuk on 5/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("Secondary view")) {
                Text("Hello, World!")
            }
            .navigationBarTitle("Primary")
            
        Text("Secondary")
             .navigationBarTitle("Secondary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
