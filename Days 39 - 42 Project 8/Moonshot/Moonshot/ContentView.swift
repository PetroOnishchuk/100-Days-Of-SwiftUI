//
//  ContentView.swift
//  Moonshot
//
//  Created by Petro Onishchuk on 2/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
    
}

struct ContentView: View {
    var body: some View {
       
            List {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
