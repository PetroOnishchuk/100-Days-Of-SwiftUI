//
//  ContentView.swift
//  Unit converter (Day 19)
//
//  Created by Petro Onishchuk on 1/19/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var checkAmount = ""
    @State var selectedKindOfUnit = 1
    @State var selectedKindOfResultUnit = 1
    
    let mililitresInUnit = ["Litre": 1000, "Cup": 240, "Pint": 473.176, "Gallon": 3785.41, "Mililitre": 1]
    
    let kindOfUnit = ["Mililitre", "Cup", "Pint", "Litre", "Gallon"]
    
    var enteredValueInMl: Double {
        let unitAmount = Double(checkAmount) ?? 0
        let mililitresInOneUnit = mililitresInUnit[kindOfUnit[selectedKindOfUnit]] ?? 0
        let mililitresInUnits = unitAmount * mililitresInOneUnit
        
        return mililitresInUnits
    }
    
    var resultValue: Double {
        let kindOfResultUnit = mililitresInUnit[kindOfUnit[selectedKindOfResultUnit]] ?? 0
        let result = enteredValueInMl / kindOfResultUnit
        
        
        return result
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Amount of unit")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }.foregroundColor(Color.orange)
                
                Section(header: Text("Kind of unit for convert")) {
                    Picker("Kind of unit", selection: $selectedKindOfUnit) {
                        ForEach(0 ..< kindOfUnit.count) {
                            Text("\(self.kindOfUnit[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .colorMultiply(.green)
                }.foregroundColor(.green)
                
                Section(header: Text("Result for converted unot")) {
                    Text("\(self.resultValue,specifier: "%.2f")")
                }.foregroundColor(.red)
                
                Section(header: Text("Kind for converted unit")) {
                    Picker("Kind of unit", selection: $selectedKindOfResultUnit) {
                        ForEach(0 ..< kindOfUnit.count) {
                            Text("\(self.kindOfUnit[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .colorMultiply(.purple)
                }.foregroundColor(.purple)
                
                
            }
        .navigationBarTitle("Unit converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
