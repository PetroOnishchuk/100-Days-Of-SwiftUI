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
            DispatchQueue.main.async {
                
            
            var tempUsers = [User]()
            
            for user in users {
                let newUser = User(context: moc)
                newUser.name = user.name
                newUser.id = user.id
                newUser.company = user.company
                newUser.isActive = user.isActive
                newUser.age = Int16(user.age)
                tempUsers.append(newUser)
            }
            
            
            for i in 0..<users.count {
              
                for friend in users[i].friends {
                
                    if let newFriend = tempUsers.first(where: { $0.id == friend.id}) {
                       
                        tempUsers[i].addToFriends(newFriend)
                      
                      
                        
                    }
                }
                
                
            }
            
            do {
                try moc.save()
            } catch let error {
                print("Could not save data: \(error.localizedDescription)")
            }
            
            }
            
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




