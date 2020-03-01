//
//  ContentView.swift
//  UsersList
//
//  Created by Petro Onishchuk on 2/28/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var users = Users()
     
    @State private var secondUsers = [User]()
    
    var body: some View {
        NavigationView {
            List(users.arrayOfUsers) {
                user in
                NavigationLink(destination: FriendView(friends: user.friends, users: self.users)) {
                    VStack(alignment: .leading, spacing: nil) {
                        Text(user.name)
                            .font(.headline)
                        Text("Age: \(user.age)")
                    }
                }
                
                
                
                
            }
        }
        .onAppear{
            // V.2 for URLSession
            let stringURL = "https://www.hackingwithswift.com/samples/friendface.json"
            
            guard let url = URL(string: stringURL) else { return }
            
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard let data = data else { return }
                
                if let decoderUsers = try? JSONDecoder().decode([User].self, from: data) {
                    
                    self.secondUsers = decoderUsers
                }
            }.resume()
            
            
            
            
            
        }
    }
    
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
