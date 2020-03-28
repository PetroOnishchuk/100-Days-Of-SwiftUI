//
//  DetailView.swift
//  PhotoAlbum
//
//  Created by Petro Onishchuk on 3/26/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var picture:  Picture
    @State private var image: Image?
    @State private var inputImage: UIImage?
    var body: some View {
        VStack {
            if image != nil {
                image?
                .resizable()
            } else {
                Text("Image not found")
            }
          
        }
        .onAppear {
            self.loadImage()
        }
    }
    
    func loadImage() {
        let fileName = getDocumentsDirectory().appendingPathComponent(picture.id.uuidString)
        do {
            let data = try Data(contentsOf: fileName)
            self.inputImage =  UIImage(data: data)
            self.image = Image(uiImage: inputImage!)
        } catch {
            print("Unable to load image")
        }
        
    }

}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
