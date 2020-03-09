//
//  InstafilterView.swift
//  Instafilter
//
//  Created by Petro Onishchuk on 3/8/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins


struct InstafilterView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicker = false
    
    @State private var inputImage: UIImage?
    
    @State private var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    
    var body: some View {
        let intensivity = Binding<Double> (
            get: {
        self.filterIntensity
        },
            set : {
        self.filterIntensity = $0
        self.applyProcessing()
        }
        )
         return VStack {
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
                self.showingImagePicker = true
            }
            
            HStack {
                Text("Intensity")
                Slider(value: intensivity)
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
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            InstafilterImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        //image = Image(uiImage: inputImage)
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func  applyProcessing() {
        currentFilter.intensity = Float(filterIntensity)
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    }
}

struct InstafilterView_Previews: PreviewProvider {
    static var previews: some View {
        InstafilterView()
    }
}
