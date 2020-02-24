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
    
    let firstPredicate = NSPredicate(format: "universe == 'Star Wars'")
    
    let secondPredicate = NSPredicate(format: "universe == %@", "Star Wars")
    
    let thirdPredicate = NSPredicate(format: "name < %@", "F")
    
    let fourstPredicate = NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
    
    let fifthPredicate = NSPredicate(format: "name BEGINSWITH %@", "E")
    
    let sixth = NSPredicate(format: "name BEGINSWITH[c] %@", "e")
    
    let seventh = NSPredicate(format: "name CONTAINS[c] %@", "e")
    
    let eighth = NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@ ", "e")) var ship: FetchedResults<Ship>
    
    
    var body: some View {
        VStack {
            List(ship, id: \.self) {
                ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: self.moc)
                ship1.name = "Enterpreise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: self.moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Treck"
                
                let ship3 = Ship(context: self.moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: self.moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? self.moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
