//
//  EditPictureView.swift
//  PhotoAlbum
//
//  Created by Petro Onishchuk on 3/27/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct EditPictureView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var pictures: [Picture]
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @State private var imageName = ""
    
    
    @State private var showingImagePicker = false
    
    var body: some View {
        NavigationView{
        VStack {
            HStack() {
            TextField("Name Field", text: $imageName)
                .multilineTextAlignment(.center)
            }
            if image != nil {
                image?
                .resizable()
                .scaledToFit()
            } else {
                Text("Select image")
                    .padding(.top, 100)
                    .onTapGesture {
                        self.showingImagePicker = true
                }
            }
            
            Spacer()
        }.padding(.top, 50)

        .sheet(isPresented: $showingImagePicker, onDismiss: addNewImage) {
            ImagePicker(image: self.$inputImage)
        }
        .navigationBarItems(trailing: Button(action: {
            self.savePictures()
            
        }, label: { Text("Save")
        }))
        }
    }
    
    func addNewImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        
    }
    
    func savePictures() {
        let picture = Picture(id: UUID(), pictureName: self.imageName)
        self.pictures.append(picture)
        print("\(self.pictures.count)")
      do {
            let fileName = getDocumentsDirectory().appendingPathComponent("Pictures")
            let data = try JSONEncoder().encode(self.pictures)
            try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection] )
        } catch {
            print("Unable to save data")
        }
        
        print("\(self.pictures.count)")
        self.presentationMode.wrappedValue.dismiss()
    }
}

//struct EditPictureView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditPictureView()
//    }
//}
