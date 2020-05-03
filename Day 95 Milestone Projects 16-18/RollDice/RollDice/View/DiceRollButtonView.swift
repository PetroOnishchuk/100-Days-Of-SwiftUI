//
//  DiceRollButtonView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 5/1/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct DiceRollButtonView: View {
    
    
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
        .font(.largeTitle)
    }
}

//struct DiceRollButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiceRollButtonView()
//    }
//}
