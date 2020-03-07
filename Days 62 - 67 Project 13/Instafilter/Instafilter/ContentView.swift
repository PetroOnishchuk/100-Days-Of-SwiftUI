//
//  ContentView.swift
//  Instafilter
//
//  Created by Petro Onishchuk on 3/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("CreatingCustomBindings")) {
                    NavigationLink(destination: CustomBinding()) {
                        Text("CreatingCustomBindings")
                    }
                }
                Section(header: Text("MultipleOptionsWithActionSheet")) {
                    NavigationLink(destination: MultipleOptionsWithActionSheet()) {
                        Text("MultipleOptionsWithActionSheet")
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
