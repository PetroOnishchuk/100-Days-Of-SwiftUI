//
//  WordScramble.swift
//  LayoutAndGeometry
//
//  Created by Petro Onishchuk on 4/23/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct DrawText: ViewModifier {
    let font = Font.system(size: 22, weight: .heavy, design: .default)
    
    func body(content: Content) -> some View {
        content
            .font(font)
    }
}

struct DrawHorisontalText: View {
    var text: String
    var textResult: String
    
    var body: some View {
        HStack {
            Text(text)
                .modifier(DrawText())
                .foregroundColor(Color.green)
            
            Text(textResult)
                .modifier(DrawText())
                .foregroundColor(Color.red)
        }
    }
}

struct WordScramble: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var allWords = [String]()
    
    @State private var totalScore = 0
    var body: some View {
        
       // NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                // MARK: Day 94. Challenge 2.1
                GeometryReader { fullView in
                    List(self.usedWords, id: \.self) { word in
                        // MARK: Day 94. Challenge 2.2
                        GeometryReader { geo in
                            HStack() {
                                Image(systemName: "\(word.count).circle")
                                    // MARK: Day 94. Challenge  3.1
                                    .foregroundColor(Color(red: Double((geo.frame(in: .global).maxY) / 800), green: 0.6, blue: 0.4))
                                Text(word)
                                Spacer()
                            }
                                // MARK: Day 94. Challenge 2.3
                                .offset(x: max(0, (geo.frame(in: .global).maxY / fullView.size.height) * (geo.frame(in: .global).maxY) - 850), y: 0)
                            
                        }
                        
                    }
                }
                DrawHorisontalText(text: "Score: ", textResult: "\(totalScore)")
                
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) { () -> Alert in
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
            .navigationBarItems(leading: Button(action: startGame, label: {
                Text("Start Game")
            }), trailing: Button(action: setNewWord, label: {
                Text("New Word")
            }))
       // }
        
    }
    // MARK: addNewWord()
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add dublicate words case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if the remaining string is empty
        guard answer.count > 0 else { return }
        
        
        // extra validation to come
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't real word")
            return
        }
        
        guard isRootWord(word: answer) else {
            wordError(title: "Word is your Root Word", message: "Be more original")
            return
        }
        
        totalScore += answer.count
        usedWords.insert(answer, at: 0)
        
        newWord = ""
    }
    
    // MARK: startGame()
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordURL) {
                // 3. Split the string up into an array of string, splitting on line breaks
                allWords = startWords.components(separatedBy: "\n")
                
                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                
                usedWords = []
                totalScore = 0
                
                // If we are here everything has worked, so we can exit
                return
                
            }
        }
        
        // If were are "here" then there was a problem - trigger a crash and report the error
        fatalError("Could not load start.txt from bundle")
        
    }
    
    
    // MARK:  isOriginal
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    // MARK: isReal
    func isReal(word: String) -> Bool {
        guard word.count >= 3 else {  return false }
        
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    //MARK: isRootWords
    func isRootWord(word: String) -> Bool {
        !(word == rootWord)
    }
    
    // MARK: wordError
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    // MARK: setNewWord
    func setNewWord() {
        rootWord = allWords.randomElement() ?? "silkworm"
        
    }
    
    
}

struct WordScramble_Previews: PreviewProvider {
    static var previews: some View {
        WordScramble()
    }
}
