//
//  TextView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 5/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI


struct HorizontalTextView: View {
    var text: String
    var textResult: String
    var fontSize: Int
    var textColor: Color
    var resultColor: Color
    
    
    var body: some View {
        VStack {
            Text(text)
                .font(Font.system(size: CGFloat(self.fontSize), weight: .heavy, design: .default))
                .foregroundColor(textColor)
                +
                Text(textResult)
                    .font(Font.system(size: CGFloat(self.fontSize), weight: .heavy, design: .default))
                    .foregroundColor(resultColor)
        }
    }
}


struct DynamicHorizontalTextView: View {
    
    var text: String
    var textResult: String
    var fontSize: Int
    var textColor: Color
    var resultColor: Color
    
    var body: some View {
        HStack {
            Text(text)
                .font(Font.system(size: CGFloat(self.fontSize), weight: .heavy, design: .default))
                .foregroundColor(textColor)
            Spacer()
            Text(textResult)
                .font(Font.system(size: CGFloat(self.fontSize), weight: .heavy, design: .default))
                .foregroundColor(resultColor)
        }
    }
}

