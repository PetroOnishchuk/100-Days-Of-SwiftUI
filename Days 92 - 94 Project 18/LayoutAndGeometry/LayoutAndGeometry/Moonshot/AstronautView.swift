//
//  AstronautView.swift
//  LayoutAndGeometry
//
//  Created by Petro Onishchuk on 4/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let font = Font.system(size: 22, weight: .bold, design: .default)
    var missions: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width)
                
                
                Text(self.astronaut.description)
                    .padding()
                
                
                VStack(alignment: .center) {
                    Text("All missions of this astronaut: ")
                        .font(self.font)
                    
                    List(self.missions) { mission in
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                            }
                        }
                        //MARK: Day 76. Project 15. Challenge 3.5
                        .accessibilityElement(children: .ignore)
                        
                        
                    }
                    
                }
                
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
        
    }
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        self.missions = missions
        
        var matches = [Mission]()
        
        for mission in missions {
            if mission.crew.first(where: {$0.name == self.astronaut.id}) != nil {
                matches.append(mission)
            }
        }
        self.missions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
