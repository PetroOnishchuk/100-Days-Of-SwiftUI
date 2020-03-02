//
//  User.swift
//  UsersList
//
//  Created by Petro Onishchuk on 2/29/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var id: String
    var name: String
    var age: Int
    var company: String
    var isActive: Bool
    var friends: [Friend]
    
    var checkIsActive: String {
        return self.isActive ? "🟢" :"🔴"
    }
}


struct Friend: Codable, Identifiable {
    var id: String
    var name: String
}
