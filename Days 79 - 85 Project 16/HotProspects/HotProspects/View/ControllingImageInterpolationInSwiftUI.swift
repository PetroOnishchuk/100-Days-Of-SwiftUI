//
//  ControllingImageInterpolationInSwiftUI.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/5/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI



struct ControllingImageInterpolationInSwiftUI: View {
    
    
    
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct ControllingImageInterpolationInSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ControllingImageInterpolationInSwiftUI()
    }
}
