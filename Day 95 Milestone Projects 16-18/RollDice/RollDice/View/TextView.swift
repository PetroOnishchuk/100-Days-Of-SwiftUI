//
//  TextView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 5/3/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct HorizontalText: View {
    var text: String
    var textResult: String
    
    var fontSize: Int
    var textColor: Color
    var resultColor: Color
    
    var body: some View {
        VStack() {
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

struct DynamicHorizontalText: View {
    var text: String
    var textResult: String
    
    var fontSize: Int
    var textColor: Color
    var resultColor: Color
    
    var body: some View {
        HStack() {
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
