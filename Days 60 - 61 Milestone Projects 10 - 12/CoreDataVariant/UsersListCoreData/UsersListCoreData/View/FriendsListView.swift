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
    
    func findUser(users:  FetchedResults<User>, friend: String) -> User {
        guard let firstUser = users.first(where: { (oneUser) -> Bool in
            oneUser.id == friend
        }) else { return users.first!}
        
     return firstUser
    }
    
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView( user: User())
    }
}
