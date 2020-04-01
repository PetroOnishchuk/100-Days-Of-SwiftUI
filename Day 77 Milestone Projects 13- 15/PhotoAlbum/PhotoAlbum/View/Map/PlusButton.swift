//
//  PlusButton.swift
//  PhotoAlbum
//
//  Created by Petro Onishchuk on 3/29/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import MapKit

struct PlusButtonView: View {
    
    @Binding var locations: [CodableMKPointAnnotation]
    @Binding var centerCoordinate: CLLocationCoordinate2D
    
    var imageName: String
    
    
    
    var body: some View {
            Button(action: {
                                // create a new location
                                let newLocation = CodableMKPointAnnotation()
                                newLocation.coordinate = self.centerCoordinate
                newLocation.title = "Location for Photo with name: \(self.imageName)"
                newLocation.subtitle = "Location added: \(Date().description)"
                                self.locations.append(newLocation)
                               
                print("\(self.locations.count)")
                                
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

//struct PlusButton_Previews: PreviewProvider {
//    static var previews: some View {
//        PlusButton()
//    }
//}
