//
//  FriendView.swift
//  UsersList
//
//  Created by Petro Onishchuk on 3/1/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct FriendView: View {
    
    var friends: [Friend]
    
    var users: Users
    
    var machesFriend = [User]()
    
    var body: some View {
        List(friends) {
            friend in
            NavigationLink(destination: DetailFriendView(friend: friend, users: self.users)) {
                VStack(alignment: .leading, spacing: nil) {
                    Text(friend.name)
                    
                }
            }
            
        }
        
    }
    
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView(friends: [Friend](),users: Users())
    }
}
