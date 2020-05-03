//
//  MainView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 4/27/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    
    
    var body: some View {
        TabView {
            RollDiceView()
                .tabItem {
                    Image(systemName: "arkit")
                    Text("Roll Dice")
            }
            
            ResultsView()
                .tabItem {
                    Text("Results")
                    Image(systemName: "list.number")
            }
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
