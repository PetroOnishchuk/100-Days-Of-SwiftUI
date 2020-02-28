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
    
    //MARK:  Challenge 1.1. Create sortDescriptors variable
    
    let sortDescriptors = [NSSortDescriptor(keyPath: \Singer.lastName, ascending: true)]
  
    // MARK: Challenege 3.3 Create @State private var filteringStyle
    @State private var filteringStyle = FilterType.beginsWith
    
     // MARK: Challenege 3.2 Create array of filteringStyle
    let arrayOfFilterType: Array<FilterType> = FilterType.allCases
    
    var body: some View {
       
        VStack {
            
            // MARK: Challenege 1.3. Put sortDescriptors to the FilterList
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, sortDescriptors: sortDescriptors, filteringType: filteringStyle){ (singer: Singer)  in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
          
            HStack {
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
            .frame(maxWidth: .infinity)

            // MARK: Challenge 3.5 . Check letter with the Button, with func checkLetter
            Button("Show A") {
                self.lastNameFilter = self.checkLetter(letter: "A")
            }
              .frame(maxWidth: .infinity)

            Button("Show S") {
                self.lastNameFilter = self.checkLetter(letter: "S")
            }
               .frame(maxWidth: .infinity)
            }
            
            
            
            // MARK: Challenge 3.6 Create Picker for filteringStyle
            Picker("For filtering Style", selection: $filteringStyle)  {
                ForEach(arrayOfFilterType, id: \.self) {
                    filterType in
                    Text("\(filterType.rawValue)")
                }
            }.pickerStyle(SegmentedPickerStyle())
                .colorMultiply(Color.green)
           
            
        }
            
        
    
        
    }
    
    
    // MARK: Challenge 3.4 Create func checkLetters
 func checkLetter(letter: String) -> String {
 
        switch filteringStyle {
        case .beginsWith:
            return letter.capitalized
        case .beginsWithCaseInsensitive:
        return letter.lowercased()
        case .contains:
        return letter
        case .containsWithCaseInsensitive:
        return letter.lowercased()
        case .endsWith:
        return letter.lowercased()
        default:
            return letter.lowercased()
        }
 
 
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
