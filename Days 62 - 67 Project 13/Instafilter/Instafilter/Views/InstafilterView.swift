//
//  InstafilterView.swift
//  Instafilter
//
//  Created by Petro Onishchuk on 3/8/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct InstafilterView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.secondary)
                
                if image != nil {
                    image?
                    .resizable()
                    .scaledToFit()
                    } else {
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
            .onTapGesture {
                // select image
            }
            
            HStack {
                Text("Intensity")
                Slider(value: self.$filterIntensity)
            }.padding(.vertical)
            
            HStack {
                Button("Change Filter") {
                    // change Filter
                }
                
                Spacer()
                
                Button("Save") {
                    // save picture
                }
            }
        }
        .padding([.horizontal, .bottom])
    .navigationBarTitle("InstafilterView")
    }
}

struct InstafilterView_Previews: PreviewProvider {
    static var previews: some View {
        InstafilterView()
    }
}
