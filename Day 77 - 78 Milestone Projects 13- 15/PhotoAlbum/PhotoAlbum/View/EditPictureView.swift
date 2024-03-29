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
    @State private var showingSourceTypeAlert = false
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var locationFetcher = LocationFetcher() 
    @State private var pickerSourceType = UIImagePickerController.SourceType.photoLibrary
    
    
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
                        .cornerRadius(20)
                } else {
                    Button(action: {
                        
                        self.showingSourceTypeAlert = true 
                        
                    }) {
                        Text("Select image")
                    }
                    .frame(width: 250, height: 70, alignment: .center)
                        
                    .background(Color.yellow)
                    .cornerRadius(20)
                    .padding(.top, 100)
                    
                }
                
                ZStack {
                    MapView(centerCoordinate:  $centerCoordinate, annotations: locations)
                        .cornerRadius(20)
                    
                    CircleView()
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            PlusButtonView(locations: $locations, centerCoordinate: $centerCoordinate, imageName: self.imageName).opacity(pickerSourceType == .camera || image == nil ? 0 : 1)
                        }
                    }
                }
                
                Spacer()
            }.padding(.top, 10)
                
                .sheet(isPresented: $showingImagePicker, onDismiss: addNewImage) {
                    ImagePicker(image: self.$inputImage, pickerSourceType: self.$pickerSourceType)
            }
            .onAppear{
                self.locationFetcher.start()
            }
            .alert(isPresented: $showingSourceTypeAlert, content: { () -> Alert in
                
                if imageName.isEmpty {
                    return  Alert(title: Text("Image Name is Empty"), message: Text("Please enter Imagename"), dismissButton: .default(Text("OK")))
                } else {
                    return Alert(title: Text("Take photo from: "), message: nil, primaryButton: .default(Text("Photo Library"), action: {
                        self.pickerSourceType = .photoLibrary
                        self.showingImagePicker = true
                    }), secondaryButton: .default(Text("Camera"), action: {
                        self.pickerSourceType = .camera
                        self.showingImagePicker = true
                    }))
                }
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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if pickerSourceType == .camera {
            
            if let location = self.locationFetcher.lastKnownLocation {
                let newLocation = CodableMKPointAnnotation()
                newLocation.coordinate = location
                newLocation.title = "Location for Photo with name: \(self.imageName)"
                
                newLocation.subtitle = "Location added: \(formatter.string(from: Date()))"
                self.locations.append(newLocation)
            }
        }
    }
    
    func savePictures() {
        let picture = Picture(id: UUID(), pictureName: self.imageName, locations: locations )
        self.pictures.append(picture)
        MenageData.savesImage(pathName: picture.id.uuidString, inputImage: self.inputImage)
        MenageData.savedPictures(pathName: "Pictures", pictures: self.pictures)
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
}

//struct EditPictureView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditPictureView()
//    }
//}
