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
              .frame(width: 300, height: 50, alignment: .center)
                .background(Color.gray)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.orange, lineWidth: 3))
                //.foregroundColor(Color.red)
                .multilineTextAlignment(.center)
                
                
                
                
                
            }
            if image != nil {
                image?
                .resizable()
                .scaledToFit()
            } else {
                Button(action: {
                    self.showingImagePicker = true
                }) {
                    Text("Select image")
                }
                .frame(width: 250, height: 70, alignment: .center)
            
                .background(Color.yellow)
                .cornerRadius(20)
                .padding(.top, 100)
            
//               
            }
            UnlockView()
            
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
        
        
        MenageData.savesImage(pathName: picture.id.uuidString, inputImage: self.inputImage)
        
        
        MenageData.savedPictures(pathName: "Pictures", pictures: self.pictures)
    
        self.presentationMode.wrappedValue.dismiss()
    }
    func saveImage() {
        
        
    }
}

//struct EditPictureView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditPictureView()
//    }
//}
