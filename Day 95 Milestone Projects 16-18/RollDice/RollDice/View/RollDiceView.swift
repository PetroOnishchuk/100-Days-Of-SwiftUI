//
//  RollDiceView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 4/27/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI


struct drawText: ViewModifier {
    let font = Font.system(size: 35, weight: .heavy, design: .default)
    
    func body(content: Content) -> some View {
        content
            .font(font)
        
    }
}
struct HorizontalText: View {
    var text: String
    var textResult: String
    var fontSize: Int
    var resultsWidth: Int
    
    var body: some View {
        HStack {
           
            Text(text)
                .font(Font.system(size: CGFloat(self.fontSize), weight: .heavy, design: .default))
                .foregroundColor(Color.green)
            
            Text(textResult)
                .font(Font.system(size: CGFloat(self.fontSize), weight: .heavy, design: .default))
                .foregroundColor(Color.red)
                .frame(width: CGFloat(self.resultsWidth))
            
        }
    }
}



struct RollDiceView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @State private var timer = Timer.publish(every: 0.5 , on: .main, in: .common)
    
    
    @State private var firstDie = 8
    @State private var secondDie = 8
    @State private var thirdDie = 8
    @State private var diceType = 8
    
    
    
    
    @State private var numberOfCallTimer = 0
    @State private var numberOfCallDispatchQueue = 0
    @State private var timeToRun = 0.0
    @State private var numberOfAngle = 0.0
    
    @State private var isShowingEditView = false
    
    @State private var numberOfDice = 2
    
    func selectDie(at number: Int) -> Int {
        switch number {
        case 1:
            return self.firstDie
        case 2:
            return self.secondDie
        case 3:
            return self.thirdDie
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach((1...self.numberOfDice), id: \.self){ number in
                        DieView(die: self.selectDie(at: number), width: 100, height: 100, cornerRadius: 25)
                            .rotationEffect(Angle(degrees: self.numberOfAngle))
                        .padding( 10)
                    }
                }
                .padding(.top, 170)
                Spacer()
                HorizontalText(text: "Result:", textResult: "\(self.countTotalResult(at: self.numberOfDice))", fontSize: 35, resultsWidth: 70)
                Spacer()
                DiceRollButtonView() {
                    self.timer.connect()
                }
                .padding(.bottom, 20)
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.isShowingEditView.toggle()
                }, label: {
                    Text("Setting")
                }))
                .sheet(isPresented: $isShowingEditView) {
                    EditDiceView(numberOfDice: self.$numberOfDice, diceType: self.$diceType)
            }
            .navigationBarTitle(Text("Roll Dice"))
            
        }
        .onReceive(timer) { (time) in
            self.runTimer()
            
        }
    }
    
    func runTimer() {
        self.numberOfCallTimer += 1
        if self.numberOfCallTimer == 6 {
            self.timer.connect().cancel()
            self.numberOfCallTimer = 0
            self.timer = Timer.publish(every: 0.5 , on: .main, in: .common)
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + self.timeToRun) {
            withAnimation {
                self.numberOfAngle += 180
            }
            self.firstDie = Int.random(in: 0...self.diceType)
            self.secondDie = Int.random(in: 0...self.diceType)
            self.thirdDie = Int.random(in: 0...self.diceType)
            self.numberOfCallDispatchQueue += 1
            if self.numberOfCallDispatchQueue == 6 {
                self.numberOfCallDispatchQueue = 0
                self.timeToRun = 0
                //MARK: Save to CoreData
                self.saveToCoreData()
            } else {
                
                self.timeToRun += 1
            }
        }
    }
    
    func saveToCoreData() {
        let firstResult = Result(context: self.moc)
        firstResult.id = UUID()
        firstResult.date = Date()
        firstResult.totalResult = self.countTotalResult(at: self.numberOfDice)
        for i in 1...self.numberOfDice {
            let newDice = Dice(context: self.moc)
            newDice.date = Date()
            newDice.id = UUID()
            newDice.result = Int16(selectDie(at: i))
            newDice.type = Int16(self.diceType)
            firstResult.addToDices(newDice)
        }
          
          firstResult.numbersOfDice = Int16(self.numberOfDice)
          try? self.moc.save()
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


