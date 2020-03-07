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
    }
}

struct WrappingAUIViewControllerInASwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WrappingAUIViewControllerInASwiftUIView()
    }
}
