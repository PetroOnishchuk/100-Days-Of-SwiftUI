//
//  Order.swift
//  CupcakeCorner
//
//  Created by Petro Onishchuk on 2/19/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation
import SwiftUI

class Order: ObservableObject, Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSpinkles = false
            }
        }
    }
    
    var hasValidAdress: Bool {
        // MARK: Chellenge 1
        
        let name = self.name.trimmingCharacters(in: .whitespacesAndNewlines)
        let streetAddress = self.streetAddress.trimmingCharacters(in: .whitespacesAndNewlines)
        let city = self.city.trimmingCharacters(in: .whitespacesAndNewlines)
        let zip = self.zip.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true 
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSpinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    @Published var extraFrosting = false
    @Published var addSpinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSpinkles, name, streetAddress, city, zip
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSpinkles, forKey: .addSpinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSpinkles = try container.decode(Bool.self, forKey: .addSpinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    init() { }
}
