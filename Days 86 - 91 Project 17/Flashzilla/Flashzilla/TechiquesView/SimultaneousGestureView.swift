//
//  SimultaneousGestureView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/10/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct SimultaneousGestureView: View {
      var body: some View {
          VStack {
              Text("Hello, Word!")
                  .onTapGesture {
                      print("Text tapped")
              }
          }
      .simultaneousGesture(
          TapGesture()
              .onEnded({ (_) in
                  print("VStack tapped")
              })
          )
      }
}

struct SimultaneousGestureView_Previews: PreviewProvider {
    static var previews: some View {
        SimultaneousGestureView()
    }
}
