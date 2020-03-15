//
//  BucketListView.swift
//  BucketList
//
//  Created by Petro Onishchuk on 3/13/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import MapKit
import LocalAuthentication


enum KindOfAler {
    case firstAlert, secondAlert
}

struct BucketListView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    @State private var showingEditScreen = false
    
    @State private var isUnlocked = false 
    
    var body: some View {
        
        ZStack {
            if isUnlocked {
                MapView(centerCoordinate:  $centerCoordinate,  selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                    .edgesIgnoringSafeArea(.all)
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            // create a new location
                            let newLocation = CodableMKPointAnnotation()
                            newLocation.coordinate = self.centerCoordinate
                            newLocation.title = "Example location"
                            self.locations.append(newLocation)
                            
                            self.selectedPlace = newLocation
                            self.showingEditScreen = true
                            
                        }) {
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(Color.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                    }
                }
            } else {
                // button here
                Button("Unlock Places") {
                    self.authenticate()
                }
            .padding()
                .background(Color.blue)
                .foregroundColor(.white)
            .clipShape(Capsule())
            }
        }
        .alert(isPresented: $showingPlaceDetails) { () -> Alert in
            
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place infirmation."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
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
            print("LLLLLLLLLL1 \(locations.count)")
        } catch {
            print("Unable to load saved data.")
        }
    }
    
    func saveData() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            print("llllllllllllllll\(locations.count)")
        } catch {
            print("Unable to save data.")
        }
    }
    
    // MARK: func authenticate
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, authenticationError) in
                
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                    }
                }
            }
        } else {
            // no biometric
        }
    }
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
    }
}
