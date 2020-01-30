//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Petro Onishchuk on 1/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI


// MARK: FlagImage for Day 24
struct FlagImage: View {
    
    var image: String
   
    
    var body: some View {
        Image(image)
        .renderingMode(.original)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
        
        
    }
}

struct ContentView: View {
    
    @State private var showingScore = false
    
    @State private var scoreTitle = ""
    
    @State private var score = 0
    
    @State  private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
    
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    @State private var isCorrect = false
    
    @State private var isWrong = false
    
    @State private var selectetNumber = 0
    
    @State private var fadeOutOpacity = false
    
    var body: some View {
       
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
            
            ForEach(0 ..< 3) { number in
                Button(action: {
                    
                    withAnimation {
                        
                        
                        self.flagTapped(number)
                    }
                    
                }) {
//                    
                    FlagImage(image: self.countries[number])
                        
                }
                .rotation3DEffect(.degrees(self.isCorrect && self.selectetNumber == number  ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(self.fadeOutOpacity && !(self.selectetNumber == number) ? 0.25 : 1)
                .rotation3DEffect(.degrees(self.isWrong && self.selectetNumber == number  ? 90 : 0), axis: (x: 0, y: 0, z: 0.5))
                
            }
                HStack {
                    Text("Your score is: ")
                    .foregroundColor(.yellow)
                    .font(.title)
                    .fontWeight(.black)
                    
                    Text("\(self.score)")
                    .foregroundColor(.red)
                    .font(.title)
                    .fontWeight(.black)
                }
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) { () -> Alert in
            Alert(title: Text(scoreTitle), message: Text("Your score is  \(self.score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    
}
    
    func flagTapped(_ number: Int) {
        self.selectetNumber = number
        if number  == correctAnswer {
            scoreTitle = "Correct"
            self.score += 1
            isCorrect = true
            fadeOutOpacity = true
            
        } else {
            scoreTitle = "Wrong!!!. That's the flag of \(countries[number])"
            self.score -= 1
            fadeOutOpacity = true
            isWrong = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showingScore = true
        }
        
    }
    
    func askQuestion() {
        self.countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        isCorrect = false
        fadeOutOpacity = false
        isWrong = false
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
}
