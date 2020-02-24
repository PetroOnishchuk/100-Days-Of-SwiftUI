//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Petro Onishchuk on 2/24/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import CoreData




struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    
    @State private var lastNameFilter = "A"
    
    
    
  
    
    
    var body: some View {
        VStack {
            // list of matching singers
            FilteredList(filter: lastNameFilter)
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
