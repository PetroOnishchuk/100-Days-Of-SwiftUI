//
//  ContentView.swift
//  BetterRest
//
//  Created by Petro Onishchuk on 1/25/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI





struct ContentView: View {
    
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 2
    
    
    var recomendedBadTime: String {
        calculateBedtime()
    }
    
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
   
    
    let kindOfCoffe = 1...20
    
    var body: some View {
        NavigationView {
            Form {
               
                Section(header: Text("When do you want to make up?"), content: {
                        
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                            .datePickerStyle(WheelDatePickerStyle())
                    
                })
                
                Section(header: Text("Desired amount of sleep")) {
                    
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section(header: Text("Daily coffee intake")) {
                    
                  Picker(selection: $coffeeAmount, label: Text("Daily coffee intake")) {
                   
                    ForEach(kindOfCoffe, id: \.self) {
                         Text("\($0)")
                    }
                                    }
                    
                }
               
                    VStack( alignment: .center, spacing: 50, content: {
                        Text("You ideal badtime is \(recomendedBadTime)")
                    })
                    VStack( alignment: .center, spacing: 50, content: {
                        Text("You ideal badtime is \(recomendedBadTime)")
                    })
                    
                    
                
                
                
            }
            .navigationBarTitle("BetterRest")
            
        }
        
    }
    

    
    func runBadTime() -> String {
       return "RunbadTime"
    }
    
   static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedtime() -> String {
        let model = SleepCalculator()
        
        let componenets = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (componenets.hour ?? 0) * 60 * 60
        let minute = (componenets.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
        
            
           return  formatter.string(from: sleepTime)
        } catch {

            return "Sorry, there was a pronlem calculating your bedtime."
        }
       
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
