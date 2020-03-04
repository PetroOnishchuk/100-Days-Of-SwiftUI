//
//  User+CoreDataProperties.swift
//  UsersListCoreDataV2
//
//  Created by Petro Onishchuk on 3/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var company: String?
    @NSManaged public var isActive: String?
    @NSManaged public var age: Int16
    @NSManaged public var friends: NSSet?

    
    public var friendsArray: [Friend] {
           let set = friends as? Set<Friend> ?? []
           return set.sorted { $0.name! < $1.name!}
       }

}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}
