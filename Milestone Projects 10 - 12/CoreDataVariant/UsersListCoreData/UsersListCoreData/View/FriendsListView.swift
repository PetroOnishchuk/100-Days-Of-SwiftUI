//
//  FriendsListView.swift
//  UsersListCoreData
//
//  Created by Petro Onishchuk on 3/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI



struct FriendsListView: View {
    
    
    var user: User
    
    
    var body: some View {
        List(user.friendsArray, id: \.wrappedId) {
            friend in
            NavigationLink(destination: DetailUserView( user: friend)) {
                VStack(alignment: .leading, spacing: nil) {
                    Text(friend.wrappedName)
                }
            }
        
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView( user: User())
    }
}
