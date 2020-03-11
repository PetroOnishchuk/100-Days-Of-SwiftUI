//
//  ContentView.swift
//  BucketList
//
//  Created by Petro Onishchuk on 3/11/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Adding conformance to Comparable for custom types")) {
                    NavigationLink(destination: AddingConformanceToComparableForCustomTypes()) {
                        Text("AddingConformanceToComparableForCustomTypes")
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
