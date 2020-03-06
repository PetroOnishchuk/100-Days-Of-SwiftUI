//
//  UserView.swift
//  UsersListV2CodeData
//
//  Created by Petro Onishchuk on 3/5/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct UserView: View {
    
    @State private var isShowFriendList = false
    
    var user: User
    
    var body: some View {
        Form{
            Section(header: Text("Name")) {
                Text(user.wrappedName)
            }
            Section(header: Text("Age")) {
                Text("\(user.wrappedAge)")
            }
            Section(header: Text("Company")) {
                Text(user.wrappedCompany)
            }
            Section(header: Text("Is Activity")) {
                Text(user.checkIsActive)
            }
            
            Section(header: Text("Switch to show friends")) {
                Toggle(isOn: $isShowFriendList) {
                    Text("Show \(user.wrappedName)'s friend")
                }
            }
            if isShowFriendList {
                Section(header: Text("\(user.wrappedName)'s friends")) {
                    NavigationLink(destination: FriendsListView(friends: self.user.friendsArray)) {
                        Text("Show \(user.wrappedName)'s friends")
                    }
                }
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User())
    }
}
