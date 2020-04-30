//
//  EditDiceView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 4/28/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct EditDiceView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var numberOfDices: Int
    @State var testNumber = 0
    let kindNumberOfDices = [1, 2, 3]
    @Binding var diceType: Int
    let kindOfTypeDice = [4, 8, 16, 32, 64, 128]
    
    var body: some View {
        NavigationView {
        Form {
            Section(header: Text("Select number of Dice").font(.title)
            ) {
                Picker("Kind of number", selection: $numberOfDices   ) {
                    ForEach(kindNumberOfDices, id: \.self) {
                      
                        Text("\($0) ")
                        
                    }
                }
            .pickerStyle(SegmentedPickerStyle())
                .colorMultiply(.green)
            }
            Section(header: Text("Select Type of Dice").font(.title)
            ) {
                Picker("Kind of Type", selection: $diceType) {
                    ForEach(kindOfTypeDice, id: \.self) {
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
        }  //
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
