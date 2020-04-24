//
//  AddressViewForChallenge3.swift
//  CupcakeCorner
//
//  Created by Petro Onishchuk on 2/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct AddressViewForChallenge3: View {
     @ObservedObject var order: MyOrder
       
       
       
       var body: some View {
           Form {
               Section {
                   TextField("Name", text: $order.orderStruct.name)
                   TextField("Street Address", text: $order.orderStruct.streetAddress)
                   TextField("City", text: $order.orderStruct.city)
                   TextField("Zip", text: $order.orderStruct.zip)
               }
               
               Section {
                NavigationLink(destination: CheckoutViewForChallenge3(order: order)) {
                       Text("Check out")
                   }
               }
               .disabled(order.orderStruct.hasValidAddress == false)
           }
           .navigationBarTitle("Delivety details", displayMode: .inline)
       }
}

struct AddressViewForChallenge3_Previews: PreviewProvider {
    static var previews: some View {
        AddressViewForChallenge3(order: MyOrder())
    }
}
