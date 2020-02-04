//
//  ContentView.swift
//  iExpense
//
//  Created by Petro Onishchuk on 2/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
    
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

   

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }.onDelete(perform: removeItems(at:))
            }
        .navigationBarTitle("iExpense")
        .navigationBarItems(trailing:
            Button(action: {
           let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                      self.expenses.items.append(expense)
                
            }){
                Image(systemName: "plus")
            })
            
        }
    }
    
    func removeItems(at ofsetts: IndexSet) {
        expenses.items.remove(atOffsets: ofsetts)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
