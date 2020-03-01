//
//  Users.swift
//  UsersList
//
//  Created by Petro Onishchuk on 2/29/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation
import SwiftUI

class Users: ObservableObject {
    @Published var arrayOfUsers = [User]()
    
    init() {
        
        let stringURL = "https://www.hackingwithswift.com/samples/friendface.json"
        
        guard let url = URL(string: stringURL) else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print("No data in response \(error?.localizedDescription)")
                return
            }
            
            if let decoderUser = try? JSONDecoder().decode([User].self, from: data) {
                self.arrayOfUsers = decoderUser
            }
        }.resume()
        
    }
}
