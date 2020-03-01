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
    
    
    var user: User
    
    var users: Users
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(){
              Spacer()
            }
            .background(Color.red)
            //            NavigationLink(destination: FriendView(users: self.users, user: self.matchesUser)) {
            //                Text(matchesUser.name)
            //                    .font(.headline)
            //                Text("ID: \(matchesUser.id)")
            //            }
            Text("Name: \(user.name)")
                .font(.headline)
            Text("Age: \(user.age)")
            Text("Company: \(user.company)")
            Text("Is Active: \(user.checkIsActive)")
            Spacer()
        }
        
    }
    
    //    init(friend: Friend, users: Users) {
    //
    //        self.friend = friend
    //        self.users = users
    //
    //        for user in users.arrayOfUsers {
    //            if user.id == friend.id {
    //                self.matchesUser = user
    //            }
    //        }
    //
    //
    //
    //    }
}

struct DetailFriendView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFriendView(friend: Friend(id: "12345", name: "Ron"), user: User(id: "123", name: "FFF", age: 30, company: "fff", isActive: true, friends: [Friend(id: "123", name: "RonF")]), users: Users())
    }
}
