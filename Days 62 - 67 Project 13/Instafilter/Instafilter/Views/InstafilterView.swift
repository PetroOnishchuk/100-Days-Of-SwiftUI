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
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    
    @State private var showingFilterSheet = false
    
    @State private var processedImage: UIImage?
    
    @State private var changeFilterTitle = ""
    
    // MARK: Challenge 1
    @State private var showingEmptyImageAlert = false
    
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
                // MARK: Challenge 2
                Button(self.changeFilterTitle.isEmpty ?  "Change Filter" : "\(changeFilterTitle)") {
                    self.showingFilterSheet = true
                }
                
                Spacer()
                
                Button("Save") {
                    // save picture
                    guard let processedImage = self.processedImage else {
                        self.showingEmptyImageAlert = true
                        return }
                    
                    let imageSaver = InstafilterImageSaver()
                    imageSaver.successHandler = {
                        print("Success!")
                    }
                    
                    imageSaver.errorHandler = {
                        print("Oops: \($0.localizedDescription)")
                    }
                    imageSaver.writeToPhotoAlbum(image: processedImage)
                }
            }
        }
        .padding([.horizontal, .bottom])
    .navigationBarTitle("InstafilterView")
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            InstafilterImagePicker(image: self.$inputImage)
        }
         .actionSheet(isPresented: $showingFilterSheet) {
            ActionSheet(title: Text("Select a filter"), message: nil, buttons: [
            .default(Text("Crystallize")) { self.setFilter(CIFilter.crystallize()) },
            .default(Text("Edges")) { self.setFilter(CIFilter.edges()) },
            .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur()) },
            .default(Text("Pixellate")) { self.setFilter(CIFilter.pixellate()) },
            .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone()) },
            .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask()) },
            .default(Text("Vignette")) { self.setFilter(CIFilter.vignette()) },
            .cancel()
            ])
        }
         .alert(isPresented: $showingEmptyImageAlert) { () -> Alert in
            Alert(title: Text("ERROR!. You not selected image"), message: nil, dismissButton: .default(Text("OK")))
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
        let inputKeys = currentFilter.inputKeys
       if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
//        currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        // MARK: Challenge 2
        self.changeFilterTitle = filter.name
        loadImage()
    }
}

struct InstafilterView_Previews: PreviewProvider {
    static var previews: some View {
        InstafilterView()
    }
}
