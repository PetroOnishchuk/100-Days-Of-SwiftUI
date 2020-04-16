//
//  SettingsScreen.swift
//  Flashzilla
//
//  Created by Petro Onishchuk on 4/16/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding  var isAddWrongAnswers: Bool
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle(isOn: $isAddWrongAnswers) {
                        Text("Add wrong answers")
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
