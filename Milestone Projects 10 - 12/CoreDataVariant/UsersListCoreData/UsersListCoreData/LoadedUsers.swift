//
//  LoadedUsers.swift
//  UsersListCoreData
//
//  Created by Petro Onishchuk on 3/3/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

class Users {
    
    static func loadDataToCD(moc: NSManagedObjectContext) {
        
        loadDataFromJSON { (users) in
            
            print("\(users.count)")
            let user1 = User(context: moc)
            user1.name = "Test1"
            user1.age = Int16(30)
            
            try? moc.save()
            
        }
    }
    
   static func loadDataFromJSON(completion: @escaping ([LoadedUser]) -> ()) {
        
        let stringURL = "https://www.hackingwithswift.com/samples/friendface.json"
        
        guard let url = URL(string: stringURL) else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            guard let data = data else {
                print("No data in response \(error?.localizedDescription ?? "No data response")")
                return
            }
            
            if let decoderLoadedUser = try? JSONDecoder().decode([LoadedUser].self, from: data) {
                
                completion(decoderLoadedUser)
                
            }
            }.resume()
        
        
    }
}
