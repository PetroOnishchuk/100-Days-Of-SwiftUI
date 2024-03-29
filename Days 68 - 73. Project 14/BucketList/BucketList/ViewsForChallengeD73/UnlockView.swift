//
//  UnlockView.swift
//  BucketList
//
//  Created by Petro Onishchuk on 3/19/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import MapKit
import LocalAuthentication


struct UnlockView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    @State private var showingEditScreen = false
    
    
    var body: some View {
        ZStack {
            MapView(centerCoordinate:  $centerCoordinate,  selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
            .edgesIgnoringSafeArea(.all)
            
            CircleView()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    PlusButtonView(locations: $locations, centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingEditScreen: $showingEditScreen)
                }
            }
        }
        .alert(isPresented: $showingPlaceDetails) { () -> Alert in
            
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                // edit this place
                self.showingEditScreen = true
                })
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
            if self.selectedPlace != nil {
                EditView(placemark: self.selectedPlace!)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func getDocumentsDirectory() -> URL {
           let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
           return path[0]
       }
       
       func loadData() {
           let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
           
           do {
               let data = try Data(contentsOf: filename)
               locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
              
           } catch {
               print("Unable to load saved data.")
           }
       }
       
       func saveData() {
           do {
               let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
               let data = try JSONEncoder().encode(self.locations)
               try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
              
           } catch {
               print("Unable to save data.")
           }
       }
}

struct UnlockView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockView()
    }
}
