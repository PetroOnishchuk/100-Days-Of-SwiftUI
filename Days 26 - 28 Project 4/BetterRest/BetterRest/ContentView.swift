//
//  ContentView.swift
//  BetterRest
//
//  Created by Petro Onishchuk on 1/25/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI





struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wekeUp = Date()
    
    // when you create a new Date instance it will be set to the current date and time
    let now = Date()
    
    // create a second Date instance set to one day in seconds from now
    let tomorrow = Date().addingTimeInterval(86400)
    
    // create a range from those two
    //let range = now ... tomorrow
    
    var body: some View {
        Form {
            DatePicker("Please enter a date", selection: $wekeUp, displayedComponents: .hourAndMinute)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
