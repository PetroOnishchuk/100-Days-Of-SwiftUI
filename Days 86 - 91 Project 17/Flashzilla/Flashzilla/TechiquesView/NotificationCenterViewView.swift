//
//  NotificationCenterViewView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/11/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct NotificationCenterViewView: View {
    @State private var inputText = ""
    
    var body: some View {
        VStack {
        Text("Hello, World!")
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { (_) in
                print("Moving to the background!")
        }
        
            Text("Hello, EFN")
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { (_) in
                    print("Moving back to the foreground!")
            }
            
            Text("Hello, Screenshot!")
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { (_) in
                    print("User took a screenshot!")
            }
            Text("Hello, Clock!")
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.significantTimeChangeNotification)) { (_) in
                    print("User changes their clock")
            }
            TextField("Test", text: $inputText)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)) { (_) in
                    print("Keyboard is shown")
            }
            
        }
        
    }
}

struct NotificationCenterViewView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCenterViewView()
    }
}
