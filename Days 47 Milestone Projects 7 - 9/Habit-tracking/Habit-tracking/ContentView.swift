//
//  ContentView.swift
//  Habit-tracking
//
//  Created by Petro Onishchuk on 2/16/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var activities = Activities()
    @State private var showingAddActivity = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items){ item in
                    NavigationLink(destination: DetailView(activities: self.activities, activity: item)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.description)
                            }
                            Spacer()
                            Text("\(item.completedTimes)")
                        }
                    }
                }
            }
        .navigationBarTitle(Text("Habit-tracking"))
            .navigationBarItems(trailing: Button(action: {
                self.showingAddActivity = true
            }, label: {
                Image(systemName: "plus")
            }))
                .sheet(isPresented: $showingAddActivity) {
                    AddActivity(activities: self.activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
