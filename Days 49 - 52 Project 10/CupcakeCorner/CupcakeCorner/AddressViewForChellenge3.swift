//
//  AddressViewForChellenge3.swift
//  CupcakeCorner
//
//  Created by Petro Onishchuk on 2/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct AddressViewForChellenge3: View {
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
                NavigationLink(destination: CheckoutViewForChellenge3(order: order)) {
                       Text("Check out")
                   }
               }
               .disabled(order.orderStruct.hasValidAdress == false)
           }
           .navigationBarTitle("Delivety details", displayMode: .inline)
       }
}

struct AddressViewForChellenge3_Previews: PreviewProvider {
    static var previews: some View {
        AddressViewForChellenge3(order: MyOrder())
    }
}
