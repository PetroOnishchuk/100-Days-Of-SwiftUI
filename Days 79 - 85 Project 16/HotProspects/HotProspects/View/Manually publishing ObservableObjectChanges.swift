//
//  Manually publishing ObservableObjectChanges.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/5/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct Manually_publishing_ObservableObjectChanges: View {
    @ObservedObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is: \(updater.value)")
     
    }
}

struct Manually_publishing_ObservableObjectChanges_Previews: PreviewProvider {
    static var previews: some View {
        Manually_publishing_ObservableObjectChanges()
    }
}
