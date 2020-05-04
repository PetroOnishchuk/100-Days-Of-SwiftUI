//
//  EditDiceView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 5/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct EditDiceView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var numberOfDice: Int
    let kindNumberOfDice = [1, 2, 3]
    @Binding var numberOfSides: Int
    let kindNumberOfSides = [4, 8, 16, 32, 64, 128]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Number of dice:").font(.title)
                ) {
                    Picker("Kind of number", selection: $numberOfDice) {
                        ForEach(kindNumberOfDice, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .colorMultiply(.green)
                }
                
                Section(header: Text("Number of sides").font(.title)) {
                    Picker("Number of sides", selection: $numberOfSides) {
                        ForEach(kindNumberOfSides, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .colorMultiply(.orange)
                }
                Spacer()
            }
            .navigationBarTitle(Text("Setting Screen"))
            .navigationBarItems(trailing: Button(action: {
                self.dismiss()
            }, label: {
                Text("Done")
            }))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

//struct EditDiceView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditDiceView()
//    }
//}
