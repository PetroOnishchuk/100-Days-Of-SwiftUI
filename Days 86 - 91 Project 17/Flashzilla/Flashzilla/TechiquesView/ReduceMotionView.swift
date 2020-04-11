//
//  ReduceMotionView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/11/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ReduceMotionView: View {
      @Environment(\.accessibilityReduceMotion) var reduceMotion
      @State private var scale: CGFloat = 1
      
      var body: some View {
          Text("Hello, World!")
          .scaleEffect(scale)
              .onTapGesture {
                  self.withOptionalAnimation {
                      self.scale *= 1.5
                  }
          }
          
      }
      
      func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
          if UIAccessibility.isReduceMotionEnabled {
              return try body()
          } else {
              return try withAnimation(animation, body)
          }
      }
}

struct ReduceMotionView_Previews: PreviewProvider {
    static var previews: some View {
        ReduceMotionView()
    }
}
