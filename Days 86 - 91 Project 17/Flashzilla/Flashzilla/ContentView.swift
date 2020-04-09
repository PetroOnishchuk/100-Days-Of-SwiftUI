//
//  ContentView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/9/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .onTapGesture(count: 2) {
                print("Double tapped")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
