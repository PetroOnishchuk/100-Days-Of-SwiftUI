//
//  Facility.swift
//  SnowSeeker
//
//  Created by Petro Onishchuk on 5/8/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct Facility {
    static func icon(for facility: String) -> some View {
        let icons = [
            "Accommodation": "house",
            "Beginners": "1.circle",
            "Cross-country": "map",
            "Eco-friendly": "leaf.arrow.circlepath",
            "Family": "person.3"
        ]
        
        if let iconName = icons[facility] {
            let image = Image(systemName: iconName)
                .accessibility(label: Text(facility))
                .foregroundColor(.secondary)
            
            return image
        } else {
            fatalError("Unknown facility type : \(facility)" )
        }
    }
    
    
}
