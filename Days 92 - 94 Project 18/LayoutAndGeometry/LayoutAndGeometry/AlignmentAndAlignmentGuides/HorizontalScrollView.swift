//
//  HorizontalScrollView.swift
//  LayoutAndGeometry
//
//  Created by Petro Onishchuk on 4/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct HorizontalScrollView: View {
   let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Rectangle()
                            .fill(self.colors[index % 7])
                            .frame(height: 150)
                            .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX - fullView.size.height / 2) / 10), axis: (x: 0, y: 1, z: 0))
                            .onTapGesture {
                                
                        }
                    }
                    .frame(width: 150)
                }
                    
                }
                .padding(.horizontal, (fullView.size.width - 150) / 2)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollView()
    }
}
