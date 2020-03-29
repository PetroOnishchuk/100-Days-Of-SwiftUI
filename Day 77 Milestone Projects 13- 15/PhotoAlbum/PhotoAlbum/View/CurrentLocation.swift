//
//  CurrentLocation.swift
//  PhotoAlbum
//
//  Created by Petro Onishchuk on 3/29/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct CurrentLocation: View {
    
    let locationFetcher = LocationFetcher()
    
    
   var body: some View {
            VStack {
                Button("Start Tracking Location") {
                    self.locationFetcher.start()
                }

                Button("Read Location") {
                    if let location = self.locationFetcher.lastKnownLocation {
                        print("Your location is \(location)")
                    } else {
                        print("Your location is unknown")
                    }
                }
            }
        }
    }
struct CurrentLocation_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocation()
    }
}
