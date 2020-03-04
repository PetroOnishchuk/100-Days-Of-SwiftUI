//
//  LoadedUser.swift
//  UsersListV2CodeData
//
//  Created by Petro Onishchuk on 3/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation

import Foundation
import SwiftUI

struct LoadedUser: Codable, Identifiable {
    var id: String?
    var name: String?
    var age: Int
    var company: String?
    var isActive: Bool
    var friends: [LoadedFriend]
    
}

struct LoadedFriend: Codable, Identifiable {
    var id: String?
    var name: String?
}
