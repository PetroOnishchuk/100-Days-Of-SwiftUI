//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Petro Onishchuk on 1/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

// MARK: v.2 DrawFlagImage for Day 24. Don't have DrawFlagImage on video.
// 25.July 2020
struct DrawFlag: ViewModifier {
 var image: String

    func body(content: Content) -> some View {
        Image(image)
        .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
            
    }
}

extension View {
    func drawingFlagImage(_ name: String ) -> some View {
        self.modifier(DrawFlag(image: name))
    }
}
struct ContentView: View {
    
    @State private var showingScore = false
    
    @State private var scoreTitle = ""
    
    @State private var score = 0
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
    
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    
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
                    self.flagTapped(number)
                }) {
//MARK: V.1 For day 24.
                    FlagImage(image: self.countries[number])
                    // MARK: v.2 DrawFlagImage for Day 24. Don't have DrawFlagImage on video.
                    // 25.July 2020
                   // Image(self.countries[number])
                        .drawingFlagImage(countries[number])
                }
                
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
        if number  == correctAnswer {
            scoreTitle = "Correct"
            self.score += 1
            
        } else {
            scoreTitle = "Wrong!!!. That's the flag of \(countries[number])"
            self.score -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        self.countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

