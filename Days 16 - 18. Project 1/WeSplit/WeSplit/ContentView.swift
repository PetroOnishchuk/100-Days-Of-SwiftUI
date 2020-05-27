//
//  ContentView.swift
//  WeSplit
//
//  Created by Petro Onishchuk on 1/16/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
// import
struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
   
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let  grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = orderAmount / 100 * tipSelection
        let totalAmount = orderAmount + tipValue
        
        return totalAmount
    }
    
   
    
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section(header: Text("Order amount")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    

                }.foregroundColor(.blue)
                Section(header: Text("Number of people")){
                    TextField("Number of people", text: $numberOfPeople).keyboardType(.decimalPad)
                    
                }.foregroundColor(.orange)
                // MARK: Section for select tip percentage
                Section(header: Text("How much tip do you want to leave?")) {
                    
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {  Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle()).colorMultiply(Color.green)
                    
                }.foregroundColor(.green)
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }.foregroundColor(.purple)
                Section(header: Text("Total amount")) {
                    Text("$\(totalAmount, specifier: "%.2f" )")
                }.foregroundColor(tipPercentages[tipPercentage] == 0 ? .red: .black)
                // MARK: Use conditional modifier for Day 24
            }
            .navigationBarTitle("WeSplit")
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
