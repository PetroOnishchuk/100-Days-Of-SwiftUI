//
//  CardView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/11/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilitiEnabled
    
    let card: Card
     //MARK: Day 91. Challenge 2.7
    var isReinsertWrongAnswers: Bool
    
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    //MARK: Day 91. Challenge 2.8
    var removal: ((_ correct: Bool) -> Void)? = nil
    @State private var feedback = UINotificationFeedbackGenerator()
    
   
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor ? Color.white : Color.white
                        .opacity(1 - Double(abs(offset.width / 50)))
            )
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        //MARK: Day 91. Challenge 3.1
                        .fill(self.setColor(for: offset.width))
                    
            )
                .shadow(radius: 10)
            VStack {
                if accessibilitiEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    if isShowingAnswer {
                       
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.gray)
                        
                    }
                }
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibility(addTraits: .isButton)
        .gesture(
            DragGesture()
                .onChanged({ (gesture) in
                    self.offset  = gesture.translation
                    self.feedback.prepare()
                })
                .onEnded({ (_) in
                    if abs(self.offset.width) > 100 {
                        if self.offset.width > 0 {
                            self.feedback.notificationOccurred(.success)
                        } else {
                            self.feedback.notificationOccurred(.error)
                        }
                        
                        // remove the card
                        //MARK: Day 91. Challenge 2.9
                        self.removal?(self.offset.width > 0)
                       
                    } else {
                        
                        self.offset = .zero
                    }
                })
        )
            .onTapGesture {
                self.isShowingAnswer.toggle()
        }
        .animation(.spring())
    }
    //MARK: Day 91. Challenge 3.2
    func setColor(for offset: CGFloat) -> Color {
        switch offset {
        case let a where a > 0:
            return .green
        case let b where b < 0:
            return .red
        default:
            return .white
        }
        //V.2 for Day 91. Challenge 3.1
//        if offset > 0 {
//            return .green
//        } else if offset < 0 {
//            return .red
//        }
//        return .white
    }
    
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(card: Card.example)
//    }
//}
