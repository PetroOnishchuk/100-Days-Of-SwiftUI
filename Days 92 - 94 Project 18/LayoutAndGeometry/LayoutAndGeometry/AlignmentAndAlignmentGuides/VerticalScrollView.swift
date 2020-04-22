//
//  VertivalScrollView.swift
//  LayoutAndGeometry
//
//  Created by Petro Onishchuk on 4/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct VerticalScrollView: View {
       let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(width: fullView.size.width)
                            .background(self.colors[index % 7])
                           // .rotation3DEffect(.degrees(Double(geo.frame(in: .global).minY - fullView.size.height / 2) / 5), axis: (x: 0, y: 1, z: 0))
                      //  .scaleEffect(max(0.8, min(1.0, geo.frame(in: .global).minY / (fullView.size.height / 5))))
                            .offset(x: max(0, (geo.frame(in: .global).maxY / fullView.size.height) * (geo.frame(in: .global).maxY) - 850), y: 0)
                            
                            .onTapGesture {
                                print("geo.frame(in: .global).maxY \(geo.frame(in: .global).maxY)")
                                print("geo.frame(in: .global).minY \(geo.frame(in: .global).minY)")
                                print("fullView.size.height:  \(fullView.size.height)")
                                print("1 /2  \(geo.frame(in: .global).maxY / fullView.size.height)")
                                print("\((geo.frame(in: .global).maxY / fullView.size.height) * 2000 - 2000)")
                        }
                    }
                    .frame(height: 40)
                }
                
            }
        }
    }
}

struct VerticalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalScrollView()
    }
}
