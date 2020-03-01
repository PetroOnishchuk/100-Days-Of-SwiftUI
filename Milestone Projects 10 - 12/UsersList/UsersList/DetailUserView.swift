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
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: \(user.name)")
                .font(.headline)
            Text("Age: \(user.age)")
            Text("Company: \(user.company)")
            Text("Is Active: \(user.checkIsActive)")
                .padding(.bottom, 30)
            
            NavigationLink(destination: FriendsListView(users: self.users, user: self.user)) {
                Text("\(user.name)'s friends")
                Spacer()
            }
            Spacer()
        }.padding(.leading, 10)
    }
}

struct DetailUserView_Previews: PreviewProvider {
    static var previews: some View {
        DetailUserView(user: User(id: "ID", name: "Name", age: 30, company: "COM", isActive: true, friends: [Friend]()), users: Users())
    }
}
