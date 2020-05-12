//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Petro Onishchuk on 5/8/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var resorts: Set<String>
    
    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"
    
    //MARK: Challenge 2. Day 99.
    init() {
        // load our saved data
        //MAKR: Day 99. Challenge 2.1. Load from UserDefaults
        if let items = UserDefaults.standard.data(forKey: saveKey) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Set<String>.self, from: items) {
                print(decoded)
                self.resorts = decoded
                return
            }
        }
        // still here? Use an empty array
        self.resorts = []
    }
    
    // returns true if our set contains this this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // adds the resort to our set, updates all view, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    // removes the resort from our set, update all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    
    func save() {
        // write out our data
        //MARK: Day 99. Challenge 2.2. Save to UserDefaults
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(resorts) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
