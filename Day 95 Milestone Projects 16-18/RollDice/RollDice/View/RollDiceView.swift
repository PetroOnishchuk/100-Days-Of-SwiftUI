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
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat = 0
    
    var body: some View {
        Text("\(dice)")
            .frame(width: self.width, height: self.height)
            .background(Color.yellow)
            .foregroundColor(.blue)
            .cornerRadius(cornerRadius)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.red, lineWidth: 2))
           // .shadow(color: .red, radius: 3)
            .font(.largeTitle)
        
    }
}

struct DrawDiceRollButtonView: View {
    var dice: Int
    
    var runFunction: (()-> Void)
    
    var body: some View {
        
        Button(action: {
            self.runFunction()
        }) {
            Text("Roll Dice")
        }
        .frame(width: 250, height: 80)
        .background(Color.purple)
        .foregroundColor(.black)
        .cornerRadius(25)
        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.blue, lineWidth: 2))
       // .shadow(color: .yellow, radius: 3)
        .font(.largeTitle)
        
        
    }
}


struct RollDiceView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @State private var timer = Timer.publish(every: 0.5 , on: .main, in: .common)
    
    
    @State private var firstDice = 0
    @State private var secondDice = 0
    @State private var thirdDice = 0
    
    @State private var diceType = 18
    
    
    
    
    @State private var numberOfCall = 0
    @State private var numberOfAfter = 0
    @State private var timeToRun = 0.0
    @State private var numberAngle = 0.0
    
    @State private var showingEditView = false
    
    @State private var numberOfDices = 3
    
    func selectDice(at number: Int) -> Int {
        switch number {
        case 1:
            return self.firstDice
        case 2:
            return self.secondDice
        case 3:
            return self.thirdDice
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    
                    ForEach((1...self.numberOfDices), id: \.self){ number in
                        DrawDiceView(dice: self.selectDice(at: number), width: 100, height: 100, cornerRadius: 25)
                            .rotationEffect(Angle(degrees: self.numberAngle))
                           
                        .padding( 10)
                    }

                    
                }
                .padding(.top, 170)
                
                //.rotationEffect(Angle(degrees: numberAngle))
                Spacer()
                DrawDiceRollButtonView(dice: self.diceType) {
                    self.timer.connect()
                }
                .padding(.bottom, 20)
                
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
            .navigationBarTitle(Text("Roll Dice"))
            
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
            self.thirdDice = Int.random(in: 0...self.diceType)
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
         let firstResult = Result(context: self.moc)
        
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
        
       
        
        if self.numberOfDices == 3 {
        let thirdDice = Dice(context: self.moc)
           thirdDice.date = Date()
           thirdDice.id = UUID()
           thirdDice.result = Int16(self.thirdDice)
           thirdDice.type = Int16(self.diceType)
            firstResult.addToDices(thirdDice)
        }
        
        
        firstResult.id = UUID()
        firstResult.date = Date()
        firstResult.totalResult = self.countTotalResult(at: self.numberOfDices)
        
        firstResult.addToDices(firstDice)
        firstResult.addToDices(secondDice)
        
        
        firstResult.numbersOfDice = Int16(self.numberOfDices)
        
        
        
        try? self.moc.save()
    }
    
    func countTotalResult(at number: Int) -> Int16 {
        switch number {
        case 1:
            return Int16(self.firstDice)
        case 2:
            return Int16(self.firstDice + self.secondDice)
        case 3:
            return Int16(self.firstDice + self.secondDice + self.thirdDice)
        default:
             return Int16(0)
        }
    }
}

struct RollDiceView_Previews: PreviewProvider {
    static var previews: some View {
        RollDiceView()
    }
}


