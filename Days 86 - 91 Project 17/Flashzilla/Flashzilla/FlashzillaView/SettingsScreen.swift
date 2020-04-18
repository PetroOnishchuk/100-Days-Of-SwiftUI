//
//  SettingsScreen.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/16/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
//MARK: Day 91. Challenge 2.3
struct SettingsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding  var isReinsertWrongAnswers: Bool
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle(isOn: $isReinsertWrongAnswers) {
                        Text("Reinsert wrong answers")
                    }
                    
                }
                
            }
            .navigationBarTitle(Text("Settings"))
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





//struct SettingsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsScreen()
//    }
//}
