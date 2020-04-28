//
//  RollDiceView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 4/27/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import CoreData

struct DrawDiceView: View {
    var dice: Int
    
    var body: some View {
        Text("\(dice)")
            .frame(width: 100, height: 100)
            .background(Color.yellow)
            .foregroundColor(.blue)
            .cornerRadius(25)
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.red, lineWidth: 2))
            .shadow(color: .blue, radius: 3)
            .font(.largeTitle)
        
    }
}

struct DrawDiceRollButtonView: View {
    var dice: Int
    
    var runFunction: (()-> Void)
    
    var body: some View {
//        Text("\(dice)")
//            .frame(width: 100, height: 100)
//            .background(Color.yellow)
//            .foregroundColor(.blue)
//            .cornerRadius(25)
//            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.red, lineWidth: 2))
//            .shadow(color: .blue, radius: 3)
//            .font(.largeTitle)
        Button(action: {
            self.runFunction()
        }) {
            Text("Button with closure")
        }
        
    }
}


struct RollDiceView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @State private var timer = Timer.publish(every: 0.5 , on: .main, in: .common)
       
    
    @State private var firstDice = 0
    @State private var secondDice = 0
    @State private var diceType = 18
    
   
    
    
    @State private var numberOfCall = 0
    @State private var numberOfAfter = 0
    @State private var timeToRun = 0.0
    @State private var numberAngle = 0.0
    
    @State private var showingEditView = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    DrawDiceView(dice: self.firstDice)
                        .rotationEffect(Angle(degrees: numberAngle))
                    
                    
                    DrawDiceView(dice: self.secondDice) .rotationEffect(Angle(degrees: numberAngle))
                }
                
                //.rotationEffect(Angle(degrees: numberAngle))
                Spacer()
                DrawDiceRollButtonView(dice: self.diceType) {
                    self.timer.connect()
                }
//                Button(action: {
//                    self.timer.connect()
//                    
//                    
//                    
//                }) {
//                    Text("Add new Results")
//                }
            }
        .navigationBarItems(trailing:
            Button(action: {
                self.showingEditView.toggle()
            }, label: {
                Text("Setting")
            }))
                .sheet(isPresented: $showingEditView) {
                    Text("Hello")
            }
            
        }
        .onReceive(timer) { (time) in
            self.runTimer2()
            
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
            
            
            self.firstDice = Int.random(in: 0...self.diceType)
            self.secondDice = Int.random(in: 0...self.diceType)
            
            self.numberOfAfter += 1
            if self.numberOfAfter == 6 {
                self.numberOfAfter = 0
                self.timeToRun = 0
                //MARK: Save to CoreData
                self.saveToCoreData()
            } else {
            
            self.timeToRun += 1
            }
            //
        }
    }
    
    func saveToCoreData() {
        let firstDice = Dice(context: self.moc)
        firstDice.date = Date()
        firstDice.id = UUID()
        firstDice.result = Int16(self.firstDice)
        firstDice.type = Int16(self.diceType)
        
        let secondDice = Dice(context: self.moc)
        secondDice.date = Date()
        secondDice.id = UUID()
        secondDice.result = Int16(self.secondDice)
        secondDice.type = Int16(self.diceType)
        
        
        let firstResult = Result(context: self.moc)
        firstResult.id = UUID()
        firstResult.date = Date()
        firstResult.totalResult = Int16(firstDice.wrappedResult + secondDice.wrappedResult)
        firstResult.addToDices(firstDice)
        firstResult.addToDices(secondDice)
        
        try? self.moc.save()
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

