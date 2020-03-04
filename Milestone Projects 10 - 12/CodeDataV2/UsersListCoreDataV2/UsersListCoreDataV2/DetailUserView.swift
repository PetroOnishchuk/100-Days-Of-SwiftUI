//
//  DetailUserView.swift
//  UsersListCoreDataV2
//
//  Created by Petro Onishchuk on 3/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct DetailUserView: View {
    
    var user: User
    
    var body: some View {
        List(user.friendsArray, id: \.id) {
            friend in
            Text("Friend \(friend.name ?? "HH")")
        }
    }
}

struct DetailUserView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        DetailUserView(user: User())
    }
}
