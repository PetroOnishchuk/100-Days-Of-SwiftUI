//
//  ContentView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 4/26/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import  CoreData


struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Result.entity(), sortDescriptors: []) var results: FetchedResults<Result>
    
    
    
    var body: some View {
        VStack {
            List {
                ForEach(results, id: \.wrappedId) { result in
                    VStack {
                    Text("Result \(result.wrappedTotalResult)")
                        Text("Dices: \(result.dicesArray[0].wrappedResult)")
                    }
                    
                }
            }
            
            Button(action: {
                let firstDice = Dice(context: self.moc)
                firstDice.date = Date()
                firstDice.id = UUID()
                firstDice.result = 10
                firstDice.type = 12
                
            let secondDice = Dice(context: self.moc)
                secondDice.date = Date()
                secondDice.id = UUID()
                secondDice.result = 12
                secondDice.type = 12
                
            let thirdDice = Dice(context: self.moc)
               thirdDice.date = Date()
               thirdDice.id = UUID()
               thirdDice.result = 14
               thirdDice.type = 12
             
                let firstResult = Result(context: self.moc)
                firstResult.addToDices(firstDice)
                firstResult.addToDices(secondDice)
                firstResult.addToDices(thirdDice)
                firstResult.id = UUID()
                firstResult.date = Date()
                firstResult.totalResult = Int16(firstDice.wrappedResult + secondDice.wrappedResult) + thirdDice.result
                
                try? self.moc.save()
                
                
                //
            }) {
                Text("Add new Results")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
