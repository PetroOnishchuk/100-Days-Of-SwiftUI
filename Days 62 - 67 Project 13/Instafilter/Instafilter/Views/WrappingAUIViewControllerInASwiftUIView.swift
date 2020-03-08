//
//  WrappingAUIViewControllerInASwiftUIView.swift
//  Instafilter
//
//  Created by Petro Onishchuk on 3/7/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct WrappingAUIViewControllerInASwiftUIView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            image?
            .resizable()
            .scaledToFit()
            
            Button("Select Image") {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) { 
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
       // UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: inputImage)
    }
}

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished")
    }
}

struct WrappingAUIViewControllerInASwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WrappingAUIViewControllerInASwiftUIView()
    }
}
