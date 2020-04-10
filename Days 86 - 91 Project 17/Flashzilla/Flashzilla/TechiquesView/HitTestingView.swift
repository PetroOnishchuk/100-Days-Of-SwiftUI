//
//  HitTestingView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/10/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct HitTestingView: View {
     var body: some View {
            ZStack {
    //            Rectangle()
    //                .fill(Color.blue)
    //                .frame(width: 300, height: 300 )
    //                .onTapGesture{
    //                    print("Rectangle tapped!")
    //            }
                
    //            Circle()
    //                .fill(Color.red)
    //                .frame(width: 300, height: 300)
    //            .contentShape(Rectangle())
    //                .onTapGesture {
    //                    print("'Circle tapped!")
    //            }
                VStack {
                    Text("Hello")
                    Spacer().frame(height: 100)
                    Text("World")
                }
            .contentShape(Rectangle())
                .onTapGesture {
                    print("Vstack tapped")
                }
            
            }
            
        }
}

struct HitTestingView_Previews: PreviewProvider {
    static var previews: some View {
        HitTestingView()
    }
}
