//
//  Order2.swift
//  CupcakeCorner
//
//  Created by Petro Onishchuk on 2/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation
import SwiftUI
class MyOrder: ObservableObject {
    @Published var orderStruct = OrderStruct()
}



struct OrderStruct: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
       
       var type = 0
        var quantity = 3
       
       var specialRequestEnabled = false {
           didSet {
               if specialRequestEnabled == false {
                   extraFrosting = false
                   addSpinkles = false
               }
           }
       }
       
       var hasValidAdress: Bool {
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
        var extraFrosting = false
        var addSpinkles = false
       
        var name = ""
        var streetAddress = ""
        var city = ""
        var zip = ""
       
       enum CodingKeys: CodingKey {
           case type, quantity, extraFrosting, addSpinkles, name, streetAddress, city, zip
       }
       
      
  	
       
       init() { }
}

