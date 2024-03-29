//
//  BetterRest.swift
//  Accessibility
//
//  Created by Petro Onishchuk on 3/22/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct drawText: ViewModifier {
    let font = Font.system(size: 22, weight: .heavy, design: .default)
    
    func body(content: Content) -> some View {
        content
            .font(font)
        
    }
}



struct BetterRest: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.25
    @State private var coffeeAmount = 2
    
    
    var recommendedBedTime: String {
        calculateBedtime()
    }
    
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    
    let rangeOfCoffee = 1...20
    
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
                    // MARK: Day 76. Project 15. Challenge 2.1
                        .accessibilityElement(children: .ignore)
                    .accessibility(value: Text("\(sleepAmount, specifier: "%g")) hours want to sleep"))
                    
                }
                
                Section(header: Text("Daily coffee intake")) {
                    
                    Picker(selection: $coffeeAmount, label: Text("Daily coffee intake")) {
                        ForEach(rangeOfCoffee, id: \.self) {
                            amount in
                            Text(amount == 1 ? "1 cup" : "\(amount) cups")
                        }
                    }
                    
                    
                }
                
                DrawHorizontalText(text: "You ideal bedtime is: ", textResult: "\(recommendedBedTime)")
                
            }
            .navigationBarTitle("BetterRest")
        }
        
    }
    
    
    
    func runBadTime() -> String {
        return "RunBadTime"
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
            
            return "Error"
        }
        
    }
}

struct BetterRest_Previews: PreviewProvider {
    static var previews: some View {
        BetterRest()
    }
}
