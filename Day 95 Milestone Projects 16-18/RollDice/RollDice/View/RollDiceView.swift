//
//  RollDiceView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 5/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct RollDiceView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var timer = Timer.publish(every: 0.5, on: .main, in: .common)
    @State private var firstDie = 8
    @State private var secondDie = 8
    @State private var thirdDie = 8
    @State private var numberOfSides = 8
    
    @State private var numberOfCallTimer = 0
    @State private var numberOfCallInDispatchQueue = 0
    @State private var timeToRun = 0.0
    @State private var numberOfAngle = 0.0
    
    @State private var isShowingEditView = false
    @State private var numberOfDice = 2
    
    
    
    
    
    
    
    
    var body: some View {
        NavigationView() {
            GeometryReader { fullView in
                ScrollView {
                    VStack {
                        Spacer()
                        HStack {
                            ForEach((1...self.numberOfDice), id: \.self) { number in
                                DieView(die: self.selectDie(at: number), width: 100, height: 100, cornerRadius: 25, backgroundColor: .yellow)
                                    .rotationEffect(Angle(degrees: self.numberOfAngle))
                                    .padding(10)
                            }
                        }
                        Spacer()
                        DynamicHorizontalTextView(text: "Result:", textResult: "\(self.countTotalResult(at: self.numberOfDice))", fontSize: 35, textColor: .green, resultColor: .red)
                            .frame(width: 210)
                        Spacer()
                        DiceRollButtonView() {
                            self.timer.connect()
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(width: fullView.size.width, height: fullView.size.height)
                    .navigationBarItems(trailing: Button(action: {
                        self.isShowingEditView.toggle()
                    }, label: {
                        Text("Setting")
                    }))
                        .sheet(isPresented: self.$isShowingEditView) {
                            EditDiceView(numberOfDice: self.$numberOfDice, numberOfSides: self.$numberOfSides)
                    }
                    .navigationBarTitle(Text("Roll Dice"))
                }
                
            }
        }.onReceive(timer) { (time) in
            self.runTimer()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func selectDie(at number: Int) -> Int {
        switch number {
        case 1:
            return self.firstDie
        case 2:
            return self.secondDie
        case 3:
            return self.thirdDie
        default:
            return self.firstDie
        }
    }
    
    
    func runTimer() {
        self.numberOfCallTimer += 1
        if self.numberOfCallTimer == 6 {
            self.timer.connect().cancel()
            self.numberOfCallTimer = 0
            self.timer = Timer.publish(every: 0.5, on: .main, in: .common)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + self.timeToRun) {
            withAnimation {
                self.numberOfAngle += 180
            }
            self.firstDie = Int.random(in: 0...self.numberOfSides)
            self.secondDie = Int.random(in: 0...self.numberOfSides)
            self.thirdDie = Int.random(in: 0...self.numberOfSides)
            self.numberOfCallInDispatchQueue += 1
            if self.numberOfCallInDispatchQueue == 6 {
                self.numberOfCallInDispatchQueue = 0
                self.timeToRun = 0
                // MARK: Save to Code Data
                self.saveToCoreData()
            } else {
                self.timeToRun += 1
            }
        }
    }
    
    func saveToCoreData() {
        let newResult = Result(context: self.moc)
        newResult.id = UUID()
        newResult.date = Date()
        newResult.totalResult = self.countTotalResult(at: self.numberOfDice)
        for i in 1...self.numberOfDice {
            let newDie = Die(context: self.moc)
            newDie.date = Date()
            newDie.id = UUID()
            newDie.dieResult = Int16(selectDie(at: i))
            newDie.numberOfSides = Int16(numberOfSides)
            newResult.addToDice(newDie)
        }
        newResult.numberOfDice = Int16(numberOfDice)
        do {
            try self.moc.save()
        } catch {
            print("Error with save to Core Data")
        }
    }
    
    func countTotalResult(at number: Int) -> Int16 {
        switch number {
        case 1:
            return Int16(self.firstDie)
        case 2:
            return Int16(self.firstDie + self.secondDie)
        case 3:
            return Int16(self.firstDie + self.secondDie + self.thirdDie)
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
