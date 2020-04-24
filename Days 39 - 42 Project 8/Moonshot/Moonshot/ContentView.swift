//
//  ContentView.swift
//  Moonshot
//
//  Created by Petro Onishchuk on 2/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isShowCrewNames = true
    var body: some View {
        
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts, missions: self.missions)) {
                    
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if self.isShowCrewNames {
                            HStack {
                                Text("Crew Names: \(mission.crewNames)")
                            }
                        } else {
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
                
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Toggle(isOn: $isShowCrewNames, label: {
                Text("Crew Names")
            }))
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
