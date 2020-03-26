//
//  ContentView.swift
//  PhotoAlbum
//
//  Created by Petro Onishchuk on 3/26/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @State private var showingImagePicker = false
    
    @State private var pictures = [Picture]()
    
    
    var body: some View {
        List(pictures) { picture in
            Text(picture.pictureName)
        }
        .onTapGesture {
            self.showingImagePicker = true
            
            
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
        .onAppear {
            self.loadPictures()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        savePictures()
        
    }
    
    func savePictures() {
        let picture = Picture(id: UUID(), pictureName: "FirstName")
        self.pictures.append(picture)
        do {
            let fileName = getDocumentsDirectory().appendingPathComponent("Pictures")
            let data = try JSONEncoder().encode(self.pictures)
            try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection] )
        } catch {
            print("Unable to save data")
        }
        
    }
    
    func loadPictures() {
        let filename = getDocumentsDirectory().appendingPathComponent("Pictures")
        
        do {
let data = try Data(contentsOf: filename)
            pictures = try JSONDecoder().decode([Picture].self, from: data)
            
        } catch {
            print("Unable to load saved data")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
