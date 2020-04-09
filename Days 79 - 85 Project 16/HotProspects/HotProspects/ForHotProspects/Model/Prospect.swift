//
//  Prospect.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI



class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    
    static let saveKey = "SavedData"
    
    init() {
//        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
//            if let decoder = try? JSONDecoder().decode([Prospect].self, from: data) {
//                self.people = decoder
//                return
//            }
//        }
        
        // MARK: Day 85. Challenege 2.3
        let fileName = Self.getDocumentsDirectory().appendingPathComponent(Self.saveKey)
        do {
            let data = try Data(contentsOf: fileName)
            let people = try JSONDecoder().decode([Prospect].self, from: data)
            
            // MARK: For Test data
          // self.people = TestPeople.createArray()
            
          self.people = people
        } catch {
            print("Unable to load saved data")
            self.people = []
        }
        
        
    }
    
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    // MARK: Save data with UserDefaults
    
    private func save2() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
    
    func add(_ prospect: Prospect) {
           people.append(prospect)
           save()
       }
    
    
   // MARK: Day 85. Challenege 2.2
     func save() {
        let fileName = Self.getDocumentsDirectory().appendingPathComponent(Self.saveKey)
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
   
    
   //  MARK: Day 85.  Challenge 2.1
    static func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
}

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var dateAdded = Date()
    fileprivate(set) var isContacted = false
}
