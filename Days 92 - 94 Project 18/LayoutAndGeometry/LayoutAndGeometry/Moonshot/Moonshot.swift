//
//  Moonshot.swift
//  LayoutAndGeometry
//
//  Created by Petro Onishchuk on 4/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct Moonshot: View {
    let astronauts: [Astrounaut] = Bundle.main.decode("astronauts.json")
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
                                // MARK: Day 76. Challenge 3.6
                                .accessibility(label: Text(mission.accessibleLaunchDate))
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

struct Moonshot_Previews: PreviewProvider {
    static var previews: some View {
        Moonshot()
    }
}
