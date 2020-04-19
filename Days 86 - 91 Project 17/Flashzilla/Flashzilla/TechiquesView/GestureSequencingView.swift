//
//  GestureSequencingView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/10/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct GestureSequencingView: View {
     // how far the circle has been dragged
       @State private var offset = CGSize.zero
       
       // whether it is currently being dragged
       @State private var isDragging = false
       
       var body: some View {
           // a drag gesture that updates offset and isDragging as it moves around
           let dragGesture = DragGesture()
               .onChanged { (value) in
                   self.offset = value.translation
           }
           .onEnded { (_) in
               withAnimation {
                   self.offset = .zero
                   self.isDragging = false
               }
           }
           
           // a long press gesture that enables isDragging
           let pressGesture = LongPressGesture()
               .onEnded { (value) in
                   withAnimation{
                       self.isDragging = true
                   }
           }
           
           // a combined gesture that forces the user to long press then drag
           let combined = pressGesture.sequenced(before: dragGesture)
           
           // a 64X64 circle that scales up when it's dragged, sets its offset to whanever we had back from the drag gesture, and uses our combined gesture
           return Circle()
               .fill(Color.red)
               .frame(width: 64, height: 64)
               .scaleEffect(isDragging ? 1.5 : 1)
           .offset(offset)
           .gesture(combined)
       }
}

struct GestureSequencingView_Previews: PreviewProvider {
    static var previews: some View {
        GestureSequencingView()
    }
}
