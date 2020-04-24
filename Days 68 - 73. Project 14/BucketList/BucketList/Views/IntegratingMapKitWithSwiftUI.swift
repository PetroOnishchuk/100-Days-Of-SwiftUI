//
//  IntegratingMapKitWithSwiftUI.swift
//  BucketList
//
//  Created by Petro Onishchuk on 3/12/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct IntegratingMapKitWithSwiftUI: View {
    
    
    var body: some View {
        MapViewDay69()
            .edgesIgnoringSafeArea(.all)
    }
    
    
    
}

struct IntegratingMapKitWithSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        IntegratingMapKitWithSwiftUI()
    }
}
