//
//  DiceView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 5/1/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct DieView: View {
       var die: Int
     var width: CGFloat
     var height: CGFloat
     var cornerRadius: CGFloat = 0
     
     
     
     var body: some View {
         Text("\(die)")
             .frame(width: self.width, height: self.height)
             .background(Color.yellow)
             .foregroundColor(.blue)
             .cornerRadius(cornerRadius)
             .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.red, lineWidth: 2))

             .font(.largeTitle)
         
     }
}

//struct DiceView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiceView()
//    }
//}
