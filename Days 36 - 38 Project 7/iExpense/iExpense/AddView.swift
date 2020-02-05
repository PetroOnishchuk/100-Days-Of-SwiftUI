//
//  AddView.swift
//  iExpense
//
//  Created by Petro Onishchuk on 2/5/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var isShowAlert = false
    @State private var messageForAllert = ""
    
    static let types = ["Business", "Personal"]
    
    @ObservedObject var expenses: Expenses
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
        .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    print("Error")
                    self.isShowAlert = true
                }
            })
        }
        .alert(isPresented: $isShowAlert) { () -> Alert in
            Alert(title: Text("Entered Amount is  INCORRECT"), message: Text("For Amount you must enter Number for example: (1, 2, 3) not a LETTER \(messageForAllert)"), dismissButton: .default(Text("OK")))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
