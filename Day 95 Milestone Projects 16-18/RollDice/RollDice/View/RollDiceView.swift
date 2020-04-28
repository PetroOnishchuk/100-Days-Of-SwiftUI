//
//  RollDiceView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 4/27/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import CoreData



struct RollDiceView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Result.entity(), sortDescriptors: []) var results: FetchedResults<Result>
    
    @State private var firstDice = 0
    @State private var secondDice = 0
    
    @State var timer = Timer.publish(every: 0.5 , on: .main, in: .common)
    
    
    
    @State private var numberOfCall = 0
    @State private var numberOfAfter = 0
    @State private var timeToRun = 0.0
    
    @State private var numberAngle = 0.0
    
    var body: some View {
        VStack {
            VStack {
            Text("First Dice \(firstDice)")
                
                .onReceive(timer) { (time) in
                    self.runTimer2()
                    
            }
            Text("Second Dice \(secondDice)")
            }
            .rotationEffect(Angle(degrees: numberAngle))
            
            Button(action: {
                self.timer.connect()
                
                
                
            }) {
                Text("Add new Results")
            }
        }
    }
    
    func runTimer2() {
        self.numberOfCall += 1
         print("Number \(self.numberOfCall)")
         if self.numberOfCall == 6 {
             self.timer.connect().cancel()
             self.numberOfCall = 0
             self.timer = Timer.publish(every: 0.5 , on: .main, in: .common)
             
         }
         DispatchQueue.main.asyncAfter(deadline: .now() + self.timeToRun) {
             
             print("Hello \(Date())")
            withAnimation {
                self.numberAngle += 180
            }
            
            
             self.firstDice = Int.random(in: 1...20)
             self.secondDice = Int.random(in: 1...20)
        
             self.numberOfAfter += 1
             if self.numberOfAfter == 6 {
                 self.numberOfAfter = 0
                 self.timeToRun = 0
             }
             // self.numberOfCall += 1
             self.timeToRun += 1
             
             //
         }
    }
}

struct RollDiceView_Previews: PreviewProvider {
    static var previews: some View {
        RollDiceView()
    }
}


//Button(action: {
//    let firstDice = Dice(context: self.moc)
//    firstDice.date = Date()
//    firstDice.id = UUID()
//    firstDice.result = 10
//    firstDice.type = 12
//
//let secondDice = Dice(context: self.moc)
//    secondDice.date = Date()
//    secondDice.id = UUID()
//    secondDice.result = 12
//    secondDice.type = 12
//
//let thirdDice = Dice(context: self.moc)
//   thirdDice.date = Date()
//   thirdDice.id = UUID()
//   thirdDice.result = 14
//   thirdDice.type = 12
//
//    let firstResult = Result(context: self.moc)
//    firstResult.addToDices(firstDice)
//    firstResult.addToDices(secondDice)
//    firstResult.addToDices(thirdDice)
//    firstResult.id = UUID()
//    firstResult.date = Date()
//    firstResult.totalResult = Int16(firstDice.wrappedResult + secondDice.wrappedResult) + thirdDice.result
//
//    try? self.moc.save()

