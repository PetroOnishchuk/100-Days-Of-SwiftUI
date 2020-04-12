//
//  CardView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/11/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    @State private var isShowingAnswer = false
    
    @State private var offset = CGSize.zero
    
    var removal: (() -> Void)? = nil
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                if isShowingAnswer {
                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.gray)
                }
            }
        .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
    .gesture(
        DragGesture()
            .onChanged({ (gesture) in
                self.offset  = gesture.translation
            })
        
            .onEnded({ (_) in
                if abs(self.offset.width) > 100 {
                    // remove the card
                    self.removal?()
                } else {
                    self.offset = .zero
                }
            })
        )
        .onTapGesture {
            self.isShowingAnswer.toggle()
        }
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
