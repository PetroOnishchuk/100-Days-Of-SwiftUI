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
    @State private var showingNameAlert = false
    
    @State private var pictures = [Picture]()
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(pictures) { picture in
                NavigationLink(destination: DetailView(picture: picture)) {
                    Text(picture.pictureName)
                }
                
                }.onDelete(perform: removeItems(at:))
            }

    .navigationBarTitle(Text("Photo Album"))
        .navigationBarItems(trailing: Button(action: {
            self.showingNameAlert = true
            
        }, label: {
            Image(systemName: "plus")
        }))
        .sheet(isPresented: $showingNameAlert, onDismiss: nil) {
            EditPictureView(pictures: self.$pictures)
           
        }
                
           
            
        .onAppear {
            self.pictures =  MenageData.loadPictures(pathName: "Pictures")
        }
    }
        
    }
    
    func removeItems(at ofsetts: IndexSet) {
        let image = pictures[ofsetts.first!]
          print(image.pictureName)
        
        MenageData.removeImage(pathName: image.id.uuidString)
         pictures.remove(atOffsets: ofsetts)
        
        MenageData.savedPictures(pathName: "Pictures", pictures: self.pictures)
    }
    
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
