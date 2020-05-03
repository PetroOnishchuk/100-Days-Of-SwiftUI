//
//  Die+CoreDataProperties.swift
//  RollDice
//
//  Created by Petro Onishchuk on 4/29/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Die {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Die> {
        return NSFetchRequest<Die>(entityName: "Die")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var result: Int16
    @NSManaged public var type: Int16
    @NSManaged public var results: Result?
    
    var wrappedDate: Date {
        date ?? Date()
    }
    
    var wrappedId: UUID {
        id ?? UUID()
    }
    
    var wrappedResult: Int {
        Int(result)
    }
    
    var wrappedType: Int {
        Int(type)
    }

}
