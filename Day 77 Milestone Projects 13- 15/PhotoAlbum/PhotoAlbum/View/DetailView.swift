//
//  DetailView.swift
//  PhotoAlbum
//
//  Created by Petro Onishchuk on 3/26/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import MapKit


struct DetailView: View {
    
    var picture:  Picture
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    
    
    var body: some View {
        
        VStack {
            DrawImageNameView(text: "Photo name: ", textResults: picture.pictureName)
            
            if image != nil {
                image?
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
            } else {
                Text("Image not found")
            }
            ZStack {
                MapView(centerCoordinate:  $centerCoordinate, annotations: picture.locations)
                    .edgesIgnoringSafeArea(.all)
            }
            Spacer()
        }
        .onAppear {
            self.loadImage()
        }
    }
    
    func loadImage() {
        let data = MenageData.loadImage(pathName: picture.id.uuidString)
        guard  let loadedData = data else {
            return
        }
        self.inputImage =  UIImage(data: loadedData)
        self.image = Image(uiImage: inputImage!)
    }
    
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
