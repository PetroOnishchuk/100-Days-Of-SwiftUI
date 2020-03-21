//
//  ContentView.swift
//  Accessibility
//
//  Created by Petro Onishchuk on 3/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {


    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: IdentifyingView()) {
                        Text("IdentifyingView")
                    }
                }
                
                Section {
                    NavigationLink(destination: HidingAndGrouping()) {
                        Text("Hiding and grouping")
                    }
                }
                
                Section {
                    NavigationLink(destination: ReadingTheValueOfControls()) {
                        Text("Reading the value of controls")
                    }
                }
                
                Section {
                    NavigationLink(destination: GuessTheFlag()) {
                        Text("Guess the flag")
                    }
                }
                
                Section {
                    NavigationLink(destination: WordScamble()) {
                        Text("Word Scramble")
                    }
                }
                
                Section {
                    NavigationLink(destination: Bookworm()) {
                        Text("Bookwork")
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
