//
//  Activity.swift
//  Habit-tracking
//
//  Created by Petro Onishchuk on 2/16/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation
import SwiftUI
//import

class Activities: ObservableObject {
    @Published var items: [Activity]{
        didSet {
            print("Run did set")
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    

    func saveActivities() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Activity].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
        
    }
}


struct Activity: Identifiable, Codable {
    let id = UUID()
    let name: String
    let description: String
    var completedTimes: Int
    
    static func == (lhs: Activity, rhs: Activity) -> Bool {
        return lhs.id == rhs.id
    }
}

