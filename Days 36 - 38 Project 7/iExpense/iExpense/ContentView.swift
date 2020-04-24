//
//  ContentView.swift
//  iExpense
//
//  Created by Petro Onishchuk on 2/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct StyleOfAmount: ViewModifier {
    var amount: Int
    func body(content: Content) -> some View {
        var font = Font.system(size: 22, weight: .heavy, design: .default)
        var foregroundColor = Color.black
        if amount < 10 {
            foregroundColor = Color.blue
            
        } else if amount == 10 || amount < 100 {
            
            foregroundColor = Color.purple
            font = Font.system(size: 25, weight: .medium, design: .monospaced)
        } else {
            foregroundColor = Color.red
            font = Font.system(size: 30, weight: .bold, design: .rounded)
            
        }
        return content
            .foregroundColor(foregroundColor)
            .font(font)
    }
}

extension View {
    func setStyleForAmount(_ amount: Int) -> some View {
        self.modifier(StyleOfAmount(amount: amount))
    }
}

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
    
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            print(" items\(items)")
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
                print("decoded \(decoded)")
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
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text("$\(item.amount)")
                            .setStyleForAmount(item.amount)
                    }
                    
                }.onDelete(perform: removeItems(at:))
            }
        .navigationBarTitle("iExpense")
        .navigationBarItems(leading: EditButton() , trailing:
            Button(action: {
                self.showingAddExpense = true
                
            }){
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showingAddExpense) { AddView(expenses: self.expenses)
            }
            
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
