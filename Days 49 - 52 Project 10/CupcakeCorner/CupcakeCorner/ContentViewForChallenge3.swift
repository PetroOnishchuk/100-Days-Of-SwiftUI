//
//  ContentViewForChallenge3.swift
//  CupcakeCorner
//
//  Created by Petro Onishchuk on 2/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentViewForChallenge3: View {
   
        
    @ObservedObject var orderStruct = MyOrder()
        
       
        var body: some View {
            NavigationView {
                Form {
                Section {
                    Picker("Select your cake type", selection: $orderStruct.orderStruct.type) {
                        ForEach(0..<OrderStruct.types.count, id: \.self) {
                            Text(OrderStruct.types[$0])
                        }
                    }
                    
                    Stepper(value: $orderStruct.orderStruct.quantity, in: 3...20) {
                        Text("Number of cakes: \(orderStruct.orderStruct.quantity)")
                    }
                }
                    
                // second Section
                    Section {
                        Toggle(isOn: $orderStruct.orderStruct.specialRequestEnabled.animation()) {
                            Text("Any special requests?")
                        }
                        
                        if orderStruct.orderStruct.specialRequestEnabled {
                            Toggle(isOn: $orderStruct.orderStruct.extraFrosting) {
                                Text("Add extra frosting")
                            }
                            
                            Toggle(isOn: $orderStruct.orderStruct.addSpinkles) {
                                Text("Add extra sprinkles")
                            }
                        }
                        
                    }
                    
                    Section {
                        NavigationLink(destination: AddressViewForChellenge3(orderStruct: orderStruct)) {
                            Text("Delivery details")
                        }
                    }
                
                }.navigationBarTitle("Cupcake Corner")
            }
        }
        
        
}

struct ContentViewForChallenge3_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewForChallenge3()
    }
}
