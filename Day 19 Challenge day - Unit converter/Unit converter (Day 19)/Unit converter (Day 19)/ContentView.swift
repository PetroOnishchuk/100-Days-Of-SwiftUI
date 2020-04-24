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
    
    let millilitersInUnit = ["Liter": 1000, "Cup": 240, "Pint": 473.176, "Gallon": 3785.41, "Milliliter": 1]
    
    let kindOfUnit = ["Milliliter", "Cup", "Pint", "Liter", "Gallon"]
    
    var enteredValueInMl: Double {
        let unitAmount = Double(checkAmount) ?? 0
        let millilitersInOneUnit = millilitersInUnit[kindOfUnit[selectedKindOfUnit]] ?? 0
        let millilitersInUnits = unitAmount * millilitersInOneUnit
        
        return millilitersInUnits
    }
    
    var resultValue: Double {
        let kindOfResultUnit = millilitersInUnit[kindOfUnit[selectedKindOfResultUnit]] ?? 0
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
