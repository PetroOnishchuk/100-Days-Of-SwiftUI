//
//  Result+CoreDataProperties.swift
//  RollDice
//
//  Created by Petro Onishchuk on 5/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Result {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Result> {
        return NSFetchRequest<Result>(entityName: "Result")
    }

    @NSManaged public var totalResult: Int16
    @NSManaged public var numberOfDice: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var dice: NSSet?
    
    var wrappedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        
        if let wrpDate = date {
            return formatter.string(from: wrpDate)
        } else {
            return formatter.string(from: Date())
        }
    }
    
    var wrappedTime: String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "h:mm a"
        if let wrpDate = date {
            return formatter.string(from: wrpDate)
        } else {
            return formatter.string(from: Date())
        }
    }
    
    var wrappedTotalResult: Int {
        Int(totalResult)
    }
    
    var wrappedNumberOfDice: Int {
        Int(numberOfDice)
    }
    
    var wrappedId: UUID {
        id ?? UUID()
    }
    
    var diceArray: [Die] {
        let set = dice as? Set<Die> ?? []
        let array = set.sorted {(firstDie, secondDie) -> Bool in
            firstDie.wrappedDieResult > secondDie.wrappedDieResult
        }
        
        return array
    }

}

// MARK: Generated accessors for dice
extension Result {

    @objc(addDiceObject:)
    @NSManaged public func addToDice(_ value: Die)

    @objc(removeDiceObject:)
    @NSManaged public func removeFromDice(_ value: Die)

    @objc(addDice:)
    @NSManaged public func addToDice(_ values: NSSet)

    @objc(removeDice:)
    @NSManaged public func removeFromDice(_ values: NSSet)

}
