//
//  Result+CoreDataProperties.swift
//  RollDice
//
//  Created by Petro Onishchuk on 4/26/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Result {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Result> {
        return NSFetchRequest<Result>(entityName: "Result")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var totalResult: Int16
    @NSManaged public var dices: NSSet?

    var wrappedDate: Date {
        date ?? Date()
    }
    
    var wrappedId: UUID {
        id ?? UUID()
    }
    
    var wrappedTotalResult: Int {
        Int(totalResult)
    }
    
    var dicesArray: [Dice] {
        let set = dices as? Set<Dice> ?? []
        return Array(set)
    }
    
}

// MARK: Generated accessors for dices
extension Result {

    @objc(addDicesObject:)
    @NSManaged public func addToDices(_ value: Dice)

    @objc(removeDicesObject:)
    @NSManaged public func removeFromDices(_ value: Dice)

    @objc(addDices:)
    @NSManaged public func addToDices(_ values: NSSet)

    @objc(removeDices:)
    @NSManaged public func removeFromDices(_ values: NSSet)

}
