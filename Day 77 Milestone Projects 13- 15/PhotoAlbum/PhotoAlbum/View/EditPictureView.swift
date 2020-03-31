//
//  EditPictureView.swift
//  PhotoAlbum
//
//  Created by Petro Onishchuk on 3/27/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import CoreLocation
import MapKit


struct EditPictureView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var pictures: [Picture]
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @State private var imageName = ""
    
    
    @State private var showingImagePicker = false
    @State private var showingSourseTypeAlert = false
    
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    
    @State private var selectedPlace: MKPointAnnotation?
    
    @State private var pickerSourceType = UIImagePickerController.SourceType.camera
    
    var body: some View {
        NavigationView{
            VStack {
                HStack() {
                    TextField("Name Field", text: $imageName)
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(Color.gray)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.orange, lineWidth: 3))
                        .multilineTextAlignment(.center)
                    
                }
                if image != nil {
                    image?
                        .resizable()
                        .scaledToFit()
                } else {
                    Button(action: {
                        self.showingSourseTypeAlert = true 
                        
                    }) {
                        Text("Select image")
                    }
                    .frame(width: 250, height: 70, alignment: .center)
                        
                    .background(Color.yellow)
                    .cornerRadius(20)
                    .padding(.top, 100)
             
                }
                Text("Select Locations for this photo")
                ZStack {
                    MapView(centerCoordinate:  $centerCoordinate, annotations: locations)
                        .edgesIgnoringSafeArea(.all)
                    
                    CircleView()
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            PlusButtonView(locations: $locations, centerCoordinate: $centerCoordinate).disabled(pickerSourceType == .camera)
                        }
                    }
                }
                
                Spacer()
            }.padding(.top, 10)
                
                .sheet(isPresented: $showingImagePicker, onDismiss: addNewImage) {
                    ImagePicker(image: self.$inputImage, pickerSourceType: self.$pickerSourceType)
            }
            .alert(isPresented: $showingSourseTypeAlert, content: { () -> Alert in
                Alert(title: Text("Take photo from: "), message: nil, primaryButton: .default(Text("Photo Library"), action: {
                    self.pickerSourceType = .photoLibrary
                    self.showingImagePicker = true
                }), secondaryButton: .default(Text("Camera"), action: {
                    self.pickerSourceType = .camera
                    self.showingImagePicker = true
                }))
            })
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
        let picture = Picture(id: UUID(), pictureName: self.imageName, locations: locations )
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
