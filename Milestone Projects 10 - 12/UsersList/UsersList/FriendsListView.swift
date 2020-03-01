//
//  FriendView.swift
//  UsersList
//
//  Created by Petro Onishchuk on 3/1/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct FriendsListView: View {
    
   
    
    var users: Users
    
    var user: User
    
   
    
    var body: some View {
        List(user.friends) {
            friend in
            NavigationLink(destination: DetailFriendView(friend: friend, user: self.users.findUser(string: friend.id), users: self.users)) {
                VStack(alignment: .leading, spacing: nil) {
                    Text(friend.name)
                    
                }
            }
            
        }.navigationBarTitle("\(self.user.name)'s friends", displayMode: .inline)
           
        
    }
    
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView(users: Users(), user: User(id: "ID", name: "Nmae", age: 30, company: "Com", isActive: true, friends: [Friend]()))
    }
}
