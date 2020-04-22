//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Petro Onishchuk on 4/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: Moonshot()) {
                        Text("Moonshot")
                    }
                }
                Section {
                    NavigationLink(destination: TestingView()) {
                        Text("TestingView")
                    }
                }
                Section {
                    NavigationLink(destination: VerticalScrollView()) {
                        Text("VerticalScrollView")
                    }
                }
                Section {
                    NavigationLink(destination: GeometryReaderBasic()) {
                        Text("GeometryReaderBasic")
                    }
                }
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


