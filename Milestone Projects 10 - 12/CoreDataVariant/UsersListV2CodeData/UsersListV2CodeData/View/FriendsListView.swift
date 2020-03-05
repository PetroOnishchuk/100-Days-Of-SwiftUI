//
//  FriendsListView.swift
//  UsersListV2CodeData
//
//  Created by Petro Onishchuk on 3/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct FriendsListView: View {
    
    
    
    var friends: [Friend]
    
    var body: some View {
        List() {
            ForEach(friends, id: \.wrappedId) { friend in
                
                NavigationLink(destination: DetailUserView(userId: friend.wrappedId)) {
                    VStack(alignment: .leading, spacing: nil) {
                        Text(friend.wrappedName)
                    }
                }
            }
            
            
        }
    }
    
}

//struct FriendsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsListView( user: User(), users: Users())
//    }
//}
