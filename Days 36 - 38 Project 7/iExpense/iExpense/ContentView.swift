//
//  ContentView.swift
//  iExpense
//
//  Created by Petro Onishchuk on 2/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
    
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
            }
        }
        self.items = []
    }
}

   

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    
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
                self.showingAddExpense = true
                
            }){
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showingAddExpense) { AddView(expenses: self.expenses)
            }
            
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
