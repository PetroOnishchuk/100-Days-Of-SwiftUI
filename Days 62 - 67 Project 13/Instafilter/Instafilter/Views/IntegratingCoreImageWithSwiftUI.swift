//
//  IntegratingCoreImageWithSwiftUI.swift
//  Instafilter
//
//  Created by Petro Onishchuk on 3/7/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins


struct IntegratingCoreImageWithSwiftUI: View {
    
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
            .resizable()
            .scaledToFit()
        }
    .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "Example") else { return }
        let beginImage = CIImage(image: inputImage)
       
        let context = CIContext()
        
//        let currentFilter = CIFilter.sepiaTone()
//
//        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1
        
//        let currentFilter = CIFilter.pixellate()
//        currentFilter.inputImage = beginImage
//        currentFilter.scale = 100
        
        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(2000, forKey: kCIInputRadiusKey)
        currentFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)
        
        // get CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else {
            return
        }
        
        // attempt to get our CGImage from our CIImage
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            // convert that to a UIImage
            let uiImage = UIImage(cgImage: cgimg)
            
            // and convert that to a SwiftUI image
            image = Image(uiImage: uiImage)
        }
        
        
    }
}

struct IntegratingCoreImageWithSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        IntegratingCoreImageWithSwiftUI()
    }
}
