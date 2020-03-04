//
//  DetailUserView.swift
//  UsersListV2CodeData
//
//  Created by Petro Onishchuk on 3/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct DetailUserView: View {
    
    
    
    var user: User
    
    var users: FetchedResults<User>
    
     @State private var isShowFriendList = false
    
    var body: some View {
        Form {
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
                    NavigationLink(destination: FriendsListView(user: self.user, users: self.users)) {
                        Text("Show \(user.wrappedName)'s friends")
                    }
                }
            }
        }
    }
}

//struct DetailUserView_Previews: PreviewProvider {
//    
//    
//    static var previews: some View {
//        DetailUserView(user: User())
//    }
//}
