//
//  MKPointAnnotation-ObservableObject.swift
//  PhotoAlbum
//
//  Created by Petro Onishchuk on 3/29/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        
        set {
            subtitle = newValue
        }
    }
}
