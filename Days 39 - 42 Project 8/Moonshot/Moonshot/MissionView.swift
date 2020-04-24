//
//  MissionView.swift
//  Moonshot
//
//  Created by Petro Onishchuk on 2/8/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    let astronauts: [CrewMember]
    
    let missions: [Mission]
    
    struct CrewMember  {
        let role: String
        let astronaut: Astronaut
    }
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                    .resizable()
                    .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    Text("Launch date: \(self.mission.formattedLaunchDate)")
                    
                    Text(self.mission.description)
                    .padding()
                    
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut, missions: self.missions)) {
                        HStack {
                            Image(crewMember.astronaut.id)
                            .resizable()
                                .frame(width: 83, height: 60)
                            .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            
                        }
                        .padding(.horizontal)
                        }.buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer(minLength: 25)
                    
                }
            }
            .navigationBarTitle(Text(self.mission.displayName), displayMode: .inline)
        }
    }
    
    init(mission: Mission, astronauts: [Astronaut], missions: [Mission]) {
        self.mission = mission
        self.missions = missions
        
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: {$0.id == member.name}) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts, missions: missions)
    }
}
