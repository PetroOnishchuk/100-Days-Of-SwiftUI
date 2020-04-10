//
//  MakingVibrationsView.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/10/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import CoreHaptics


struct MakingVibrationsView: View {
    @State private var engine: CHHapticEngine?
    
    
    var body: some View {
        Text("Hello, Word!")
        .onAppear(perform: prepareHaptics)
        .onTapGesture(perform: complexSuccess)
    }
    
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("These was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        
        var events = [CHHapticEvent]()
        
        // create one intense, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.stop(atTime: 0)
        } catch {
            print("Failde to play pattern: \(error.localizedDescription)")
        }
    }
}

struct MakingVibrationsView_Previews: PreviewProvider {
    static var previews: some View {
        MakingVibrationsView()
    }
}
