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




struct BucketListView: View {
    
    @State private var isUnlocked = false 
    
    var body: some View {
        
        ZStack {
            if isUnlocked {
                UnlockView()
            } else {
                UnlockButtonView(isUnlocked: $isUnlocked)
            }
        }
    }
    
    
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
    }
}
