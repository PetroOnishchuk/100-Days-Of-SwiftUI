//
//  Activity.swift
//  Habit-tracking
//
//  Created by Petro Onishchuk on 2/16/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation
import SwiftUI


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

/*
 In our example we have struct Activity.
 Our struct activity has a forth properties
 
 let id = UUID()
 let name: String
 let description: String
 var completedTimes: Int
 
 We wont to compare one Activity object and another Activity object, and say, This is two Activity object is EQUAL or NOT EQUAL
 
 static func in our example have access to the Object and all properties  in our object.
 
 And we must say Xcode what properties in two object, he must compare.
 
 And through our static func we take "id" properties from two Activity object and
 if firtsActiviti.id (lhs.id)  the same secondsActivity.id(rhs.id)
 if the same return true if not return false.
 
 If we wont to compare a simple
 let firstAge = 10
 let secondAge = 20
 
 I hope, i explained.
 For ourself, search Compare custom Object in Swift.
 
 
 
 */
