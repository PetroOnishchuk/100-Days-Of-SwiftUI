////
////  ddd.swift
////  BetterRest
////
////  Created by Petro Onishchuk on 1/26/20.
////  Copyright © 2020 Petro Onishchuk. All rights reserved.
////
//
//import Foundation
//
//
////
////  ContentView.swift
////  BetterRest
////
////  Created by Petro Onishchuk on 1/25/20.
////  Copyright © 2020 Petro Onishchuk. All rights reserved.
////
//
//import SwiftUI
//
//struct drawText: ViewModifier  {
//    let font = Font.system(size: 22, weight: .heavy, design: .default)
//    
//    func body(content: Content) -> some View {
//        content
//        .font(font)
//    }
//}
//
//struct DrawHorisontalText: View {
//    var text: String
//    var textResult: String
//    
//    var body: some View {
//        HStack {
//            Text(text)
//            .modifier(drawText())
//                .foregroundColor(Color.blue)
//            
//            Text(textResult)
//            .modifier(drawText())
//                .foregroundColor(Color.red)
//        }
//    }
//}
//
//
//
//
//
//struct ContentView: View {
//    
//    
//    @State private var wakeUp = defaultWakeTime
//    @State private var sleepAmount = 8.0
//    @State private var coffeeAmount = 1
//    
//    @State private var alertTitle = ""
//    @State private var alertMessage = ""
//    @State private var showingAlert = false
//    
//   
//    let rangeOfCoffee = 1...20
//    
//    var recomendedBadTime: String {
//        calculateBedtime()
//    }
//    
//    
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("When do you want to wake up?")) {
//                   
//                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                    .labelsHidden()
//                        .datePickerStyle(WheelDatePickerStyle())
//                }
//                
//                Section(header: Text("Desired amount of sleep")) {
//                
//                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
//                        Text("\(sleepAmount, specifier: "%g") hours")
//                    }
//                }
//                
//                Section(header: Text("Daily coffee intake")) {
//                    
//                    Picker(selection: $coffeeAmount, label: Text("Daily coffe intake")) {
//                        ForEach(rangeOfCoffee, id: \.self) {
//                            amount in
//                            Text(amount == 1 ? "1 cup" : "\(amount) cups")
//                        }
//                    }
//            
//                }
//                DrawHorisontalText(text: "You ideal badtime is: ", textResult: "\(recomendedBadTime)")
//            }
//        .navigationBarTitle("BetterRest")
//     
//        }
//        
//    }
//    
//  
//    
//    
//   static var defaultWakeTime: Date {
//        var components = DateComponents()
//        components.hour = 7
//        components.minute = 0
//        return Calendar.current.date(from: components) ?? Date()
//    }
//    
//    func calculateBedtime() -> String {
//        let model = SleepCalculator()
//        
//        let componenets = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
//        let hour = (componenets.hour ?? 0) * 60 * 60
//        let minute = (componenets.minute ?? 0) * 60
//        
//        do {
//            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
//            let sleepTime = wakeUp - prediction.actualSleep
//            
//            let formatter = DateFormatter()
//            formatter.timeStyle = .short
//            
//            return formatter.string(from: sleepTime)
//           
//            
//        } catch {
//            return "Error"
//           
//        }
//        
//    }
//    
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
