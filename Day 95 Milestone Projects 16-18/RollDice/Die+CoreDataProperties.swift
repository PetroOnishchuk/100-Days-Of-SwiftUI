//
//  Die+CoreDataProperties.swift
//  RollDice
//
//  Created by Petro Onishchuk on 5/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Die {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Die> {
        return NSFetchRequest<Die>(entityName: "Die")
    }

    @NSManaged public var numberOfSides: Int16
    @NSManaged public var dieResult: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var mainResult: Result?
    
    var wrappedNumberOfSides: Int {
        Int(numberOfSides)
    }
    
    var wrappedDieResult: Int {
        Int(dieResult)
    }
    
    var wrappedId: UUID {
        id ?? UUID()
    }
    
    var wrappedDate: Date {
        date ?? Date()
    }

}
