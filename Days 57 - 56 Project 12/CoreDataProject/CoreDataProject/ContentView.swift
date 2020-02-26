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
    
    
    @FetchRequest(entity: Country.entity(), sortDescriptors: []) var countries: FetchedResults<Country>
    
    
    let sortDescriptors = [NSSortDescriptor(keyPath: \Singer.lastName, ascending: true)]
  
    
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, sortDescriptors: sortDescriptors ) { (singer: Singer)  in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }

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
                
                let dale = Singer(context: self.moc)
                dale.firstName = "Dale"
                dale.lastName = "Sakamoto"
                
                let antonio = Singer(context: self.moc)
                antonio.firstName = "Antonio"
                antonio.lastName = "Salieri"
                
                let britney = Singer(context: self.moc)
                britney.firstName = "Britney"
                britney.lastName = "Spears"
                
                let becky = Singer(context: self.moc)
                becky.firstName = "Becky"
                becky.lastName = "Stark"
                
                let victoria = Singer(context: self.moc)
                victoria.firstName = "Victoria"
                victoria.lastName = "Acosta"
                
                let mars = Singer(context: self.moc)
                mars.firstName = "Mars"
                mars.lastName = "Argo"
                
                let toni = Singer(context: self.moc)
                toni.firstName = "Toni"
                toni.lastName = "Arden"

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
