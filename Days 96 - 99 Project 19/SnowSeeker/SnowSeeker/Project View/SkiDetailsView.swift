//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Petro Onishchuk on 5/7/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort
    
    
    var body: some View {
        VStack {
            Text("Elevation: \(resort.elevation)m")
            Text("Snow: \(resort.snowDepth)cm")
        }
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
    }
}
