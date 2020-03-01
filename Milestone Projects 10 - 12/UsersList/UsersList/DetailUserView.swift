//
//  DetailUserView.swift
//  UsersList
//
//  Created by Petro Onishchuk on 3/1/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct DetailUserView: View {
    var user: User
    
    var users: Users
    
    var isShowFriendList = true
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                Text(user.name)
            }
            
            Section(header: Text("Age")) {
                Text("\(user.age)")
            }
            
            Section(header: Text("Company")) {
                Text(user.company)
            }
            
            Section(header: Text("Is Activity")) {
                Text(user.checkIsActive)
            }
            
            if isShowFriendList {
            Section(header: Text("\(user.name)'s friends")) {
                NavigationLink(destination: FriendsListView(users: self.users, user: self.user)) {
                    Text("Show \(user.name)'s friends")
                }
            }
            }
            
            
        }
        .navigationBarTitle(Text("User: \(user.name)"), displayMode: .inline)

    }
}

struct DetailUserView_Previews: PreviewProvider {
    static var previews: some View {
        DetailUserView(user: User(id: "ID", name: "Name", age: 30, company: "COM", isActive: true, friends: [Friend]()), users: Users())
    }
}
