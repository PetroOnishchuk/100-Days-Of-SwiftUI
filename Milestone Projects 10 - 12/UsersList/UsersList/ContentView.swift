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
     
    
    
    var body: some View {
        NavigationView {
            List(users.arrayOfUsers) {
                user in
                NavigationLink(destination: DetailUserView(user: user, users: self.users)) {
                    VStack(alignment: .leading, spacing: nil) {
                        Text(user.name)
                            .font(.headline)
                        Text("Age: \(user.age)")
                        Text("Is Active: \(user.checkIsActive)")
                    }
                }
                
                
                
                
            }
        }
        
    }
    
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
