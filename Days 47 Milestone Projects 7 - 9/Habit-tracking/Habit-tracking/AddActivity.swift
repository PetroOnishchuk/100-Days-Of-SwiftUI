//
//  AddActivity.swift
//  Habit-tracking
//
//  Created by Petro Onishchuk on 2/16/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct AddActivity: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var activities: Activities
    
    @State private var name = ""
    @State private var decription = ""
    @State private var amount = 0
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter name of habit")) {
                    TextField("Name", text: $name)
                }
                
                Section(header: Text("Enter description of habit")) {
                    TextField("Descriptions", text: $decription)
                }
                
                Section(header: Text("Completed times")) {
                    Stepper(value: $amount, in: 0...Int.max, step: 1) {
                        Text("\(amount) times")
                    }
                }
            }
            .navigationBarTitle("Add new Activity")
            .navigationBarItems(trailing: Button(action: {
                let item = Activity(name: self.name, description: self.decription, completedTimes: self.amount)
               // MARK: V.1 For save activities
                self.activities.items.append(item)
                self.activities.saveActivities()
                
                
                // MARK: V.2 for save Activities
                // V.2 If didSet don't run after "self.activities.items.append(tempActivities)
                
                
                //                var tempArray = self.activities.items
                
                //                tempArray.append(item)
                //
                //                self.activities.items = tempArray
                //
                
                
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Save")
            }))
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(activities: Activities())
    }
}
