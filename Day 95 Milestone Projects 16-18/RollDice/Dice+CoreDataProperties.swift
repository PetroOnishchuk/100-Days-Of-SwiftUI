//
//  Dice+CoreDataProperties.swift
//  RollDice
//
//  Created by Petro Onishchuk on 4/26/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Dice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dice> {
        return NSFetchRequest<Dice>(entityName: "Dice")
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
    
    var wrapppedType: Int {
        Int(type)
    }
    
    

}
