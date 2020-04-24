//
//  ContentViewForChallenge3.swift
//  CupcakeCorner
//
//  Created by Petro Onishchuk on 2/20/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentViewForChallenge3: View {
   
        
    @ObservedObject var order = MyOrder()
        
       
        var body: some View {
            NavigationView {
                Form {
                Section {
                    Picker("Select your cake type", selection: $order.orderStruct.type) {
                        ForEach(0..<OrderStruct.types.count, id: \.self) {
                            Text(OrderStruct.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.orderStruct.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.orderStruct.quantity)")
                    }
                }
                    
                // second Section
                    Section {
                        Toggle(isOn: $order.orderStruct.specialRequestEnabled.animation()) {
                            Text("Any special requests?")
                        }
                        
                        if order.orderStruct.specialRequestEnabled {
                            Toggle(isOn: $order.orderStruct.extraFrosting) {
                                Text("Add extra frosting")
                            }
                            
                            Toggle(isOn: $order.orderStruct.addSpinkles) {
                                Text("Add extra sprinkles")
                            }
                        }
                        
                    }
                    
                    Section {
                        NavigationLink(destination: AddressViewForChallenge3(order: order)) {
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
