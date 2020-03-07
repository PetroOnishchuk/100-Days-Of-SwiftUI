//
//  CustomBinding.swift
//  Instafilter
//
//  Created by Petro Onishchuk on 3/7/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct CustomBinding: View {
    @State private var blurAmount: CGFloat = 0 {
           didSet {
               print("New value is \(blurAmount)")
           }
       }
       
       
       var body: some View {
           let blur = Binding<CGFloat>(
               get: {
                   self.blurAmount
           },
               set: {
                   self.blurAmount = $0
                   print("New value is \(self.blurAmount)")
           }
           )
          return  VStack {
               Text("Hello, Word!")
               .blur(radius: blurAmount)
               
               Slider(value: blur, in: 0...20)
           }
       }
}

struct CustomBinding_Previews: PreviewProvider {
    static var previews: some View {
        CustomBinding()
    }
}
