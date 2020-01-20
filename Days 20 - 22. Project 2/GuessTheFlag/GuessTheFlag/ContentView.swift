//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Petro Onishchuk on 1/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    
    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
            
        }.alert(isPresented: $showingAlert) { () -> Alert in
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
