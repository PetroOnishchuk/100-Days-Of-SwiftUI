//
//  MainView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 5/4/20.
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
                    Image(systemName: "list.number")
                    Text("Results")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
