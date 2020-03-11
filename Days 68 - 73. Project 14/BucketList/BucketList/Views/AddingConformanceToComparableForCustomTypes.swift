//
//  AddingConformanceToComparableForCustomTypes.swift
//  BucketList
//
//  Created by Petro Onishchuk on 3/11/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct AddingConformanceToComparableForCustomTypes: View {
    
    let users = [
    User(firstName: "Arnold", lastName: "Rimmer"),
    User(firstName: "Kristine", lastName: "Kochanski"),
    User(firstName: "David", lastName: "Lister")
        ].sorted()
    
    let values = [1, 5, 3, 6, 2, 9].sorted()
    var body: some View {
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}


struct User: Identifiable, Comparable {
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
    
    let id = UUID()
    let firstName: String
    let lastName: String
    
    
}

struct AddingConformanceToComparableForCustomTypes_Previews: PreviewProvider {
    static var previews: some View {
        AddingConformanceToComparableForCustomTypes()
    }
}
