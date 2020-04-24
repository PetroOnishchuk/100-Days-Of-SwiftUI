//
//  UsingTouchIDAndFaceIDWithSwiftUI.swift
//  BucketList
//
//  Created by Petro Onishchuk on 3/12/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import LocalAuthentication
struct UsingTouchIDAndFaceIDWithSwiftUI: View {
    
    @State private var isUnlocked = false
    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
    .onAppear(perform: authenticate)
    }
    
    
    
    
    
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                DispatchQueue.main.async {
                    if success {
                        // authenticated successfully
                        self.isUnlocked = true
                    } else {
                        // there was a problem
                    }
                }
                
            }
        } else {
            // no biometrics
        }
    }
}

struct UsingTouchIDAndFaceIDWithSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UsingTouchIDAndFaceIDWithSwiftUI()
    }
}
