//
//  JSONUser.swift
//  UsersListCoreData
//
//  Created by Petro Onishchuk on 3/3/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation
import SwiftUI

struct LoadedUser: Codable, Identifiable {
    var id: String?
    var name: String?
    var age: Int?
    var company: String?
    var isActive: Bool?
    var friends: [Friend]
    
}

struct Friend: Codable, Identifiable {
    var id: String?
    var name: String?
}
