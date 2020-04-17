//
//  ContentView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/9/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    enum TypeOfSheet {
        case editCards
        case settingsScreen
    }
    
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    
    
    @State private var cards = [Card]()
    @State private var offset = CGSize.zero
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isActive = true
    
    
    
    //MARK: Day 91. Challenge 1.2
    @State private var isTimeIsOver = false
    
    //MARK: Day 91. Challenege 2.1
    @State private var showingSheet = false
    @State private var typeOfSheet = TypeOfSheet.editCards
    @State private var isReinsertWrongAnswers = false
    
    var body: some View {
        
        ZStack {
            Image(decorative: "background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Text("Time: \(timeRemaining)")
                    .frame(width: 220)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Color.black)
                            .opacity(0.75)
                )
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in CardView(card: self.cards[index], isAddWrongAnswers: self.isReinsertWrongAnswers) { (correct) in
                        withAnimation {
                            self.removeCard(at: index, isSuccess: correct)
                        }
                    }
                    .stacked(at: index, in: self.cards.count)
                    .allowsHitTesting(index == self.cards.count - 1)
                    .accessibility(hidden: index < self.cards.count - 1)
                    }
                    
                }
                .allowsHitTesting(timeRemaining > 0)
                //MARK: Day 91. Challenge 1.2
                if isTimeIsOver {
                    Text("Your Time Is Over")
                        .font(.title)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.red)
                        .clipShape(Capsule())
                        .padding(.vertical, 20)
                        .frame(width: 250)
                }
                
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                }
            }
            VStack {
                // MARK: Day 91. Challeneg 2. Adding SettingScreen to ContentView
                HStack {
                    Button(action: {
                        self.typeOfSheet = .settingsScreen
                        self.showingSheet = true
                    }) {
                        Image(systemName: "gear")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                    Spacer()
                    
                    Button(action: {
                        self.typeOfSheet = .editCards
                        self.showingSheet = true
                    }) {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                }
                Spacer()
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
            if !differentiateWithoutColor || accessibilityEnabled {
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.removeCard(at: self.cards.count - 1, isSuccess: false)
                            }
                        }) {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(Color.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibility(label: Text("Wrong"))
                        .accessibility(hint: Text("Mark your answer as being incorrect."))
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                self.removeCard(at: self.cards.count - 1, isSuccess: true)
                            }
                        }) {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(Color.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibility(label: Text("Correct"))
                        .accessibility(hint: Text("Mark your answer as being correct."))
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .sheet(isPresented: $showingSheet, onDismiss: resetCards, content: {
            if self.typeOfSheet  == .settingsScreen  {
                SettingsScreen(isReinsertWrongAnswers: self.$isReinsertWrongAnswers)
            } else if self.typeOfSheet == .editCards {
                EditCards()
            }
            
            
            
        })
            .onAppear(perform: resetCards)
            .onReceive(timer) { (time) in
                guard self.isActive else { return }
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }
                
                //MARK: Day 91. Challenge 1.3
                if self.timeRemaining == 0 {
                    self.isTimeIsOver = true
                    self.cards = []
                    self.isActive = false
                }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { (_) in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { (_) in
            if self.cards.isEmpty == false {
                self.isActive = true
            }
        }
    }
    func removeCard(at index: Int, isSuccess: Bool) {
        guard index >= 0 else {
            return
        }
        
        //MARK: Day 91. Challenge 2.2
        let card = cards.remove(at: index)
        
        if isReinsertWrongAnswers && !isSuccess {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.cards.insert(card, at: 0)
            }
        }
        
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards() {
        isTimeIsOver = false
        timeRemaining = 30
        isActive = true
        loadData()
    }
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded  = try? JSONDecoder().decode([Card].self, from: data) {
                self.cards = decoded
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
