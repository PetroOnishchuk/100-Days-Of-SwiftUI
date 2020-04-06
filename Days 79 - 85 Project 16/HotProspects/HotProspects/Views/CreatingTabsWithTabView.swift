//
//  CreatingTabsWithTabView.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI




struct CreatingTabsWithTabView: View {
     @State private var selectedTab = 0
     
     
     var body: some View {
         TabView(selection: $selectedTab) {
             Text("Tab 1")
                 .onTapGesture {
                     self.selectedTab = 1
                 }
                 .tabItem {
                     Image(systemName: "star")
                     Text("One")
             }
             .tag(0)
             
             Text("Tab 2")
                 .onTapGesture {
                     self.selectedTab = 0
                 }
                 .tabItem {
                     Image(systemName: "star.fill")
                     Text("Two")
             }
         .tag(1)
             
         }
    }
}

struct CreatingTabsWithTabView_Previews: PreviewProvider {
    static var previews: some View {
        CreatingTabsWithTabView()
    }
}
