//
//  DetailFriendView.swift
//  UsersList
//
//  Created by Petro Onishchuk on 3/1/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct DetailFriendView: View {
    
    var friend: Friend
    
    var matchesFriend = User(id: "123", name: "FFF", age: 30, company: "fff", friends: [Friend(id: "123", name: "RonF")])
    
    var users: Users
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            
            NavigationLink(destination: FriendView(friends: matchesFriend.friends, users: self.users)) {
                Text(matchesFriend.name)
                    .font(.headline)
                Text("ID: \(matchesFriend.id)")
            }
        }
    }
    
    init(friend: Friend, users: Users) {
    
        self.friend = friend
        self.users = users
        
        for user in users.arrayOfUsers {
            if user.id == friend.id {
                self.matchesFriend = user
            }
        }
        
        
        
    }
}

struct DetailFriendView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFriendView(friend: Friend(id: "12345", name: "Ron"), users: Users())
    }
}
