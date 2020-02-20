//
//  AddressViewForChellenge3.swift
//  CupcakeCorner
//
//  Created by Petro Onishchuk on 2/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct AddressViewForChellenge3: View {
     @ObservedObject var orderStruct: MyOrder
       
       
       
       var body: some View {
           Form {
               Section {
                   TextField("Name", text: $orderStruct.orderStruct.name)
                   TextField("Street Address", text: $orderStruct.orderStruct.streetAddress)
                   TextField("City", text: $orderStruct.orderStruct.city)
                   TextField("Zip", text: $orderStruct.orderStruct.zip)
               }
               
               Section {
                NavigationLink(destination: CheckoutViewForChellenge3(orderStruct: orderStruct)) {
                       Text("Check out")
                   }
               }
               .disabled(orderStruct.orderStruct.hasValidAdress == false)
           }
           .navigationBarTitle("Delivety details", displayMode: .inline)
       }
}

struct AddressViewForChellenge3_Previews: PreviewProvider {
    static var previews: some View {
        AddressViewForChellenge3(orderStruct: MyOrder())
    }
}
