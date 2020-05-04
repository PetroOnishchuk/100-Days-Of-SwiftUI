//
//  DieView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 5/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI


struct DieView: View {
    
    var die: Int
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    var backgroundColor: Color
    
    
    var body: some View {
        Text("\(die)")
            .frame(width: self.width, height: self.height)
            .background(backgroundColor)
            .foregroundColor(.blue)
            .cornerRadius(cornerRadius)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.red, lineWidth: 2))
            .font(backgroundColor == Color.yellow ? .title : .headline)
    }
}




//struct DieView_Previews: PreviewProvider {
//    static var previews: some View {
//        DieView()
//    }
//}
