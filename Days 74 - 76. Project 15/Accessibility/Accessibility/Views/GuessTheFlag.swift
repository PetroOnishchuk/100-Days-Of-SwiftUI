//
//  GuessTheFlag.swift
//  Accessibility
//
//  Created by Petro Onishchuk on 3/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct GuessTheFlag: View {
    @State private var showingScore = false
        
        @State private var scoreTitle = ""
        
        @State private var score = 0
        
        @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
        
        
        @State var correctAnswer = Int.random(in: 0...2)
        
    
        //MARK: Project 15. Day 75
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
        
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
                            .font(.title)
                            .fontWeight(.black)
                        
                    }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
    //
                        FlagImage(image: self.countries[number])
                            .accessibility(label: Text(self.labels[self.countries[number], default: "Unknown"]))
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
struct GuessTheFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlag()
    }
}

