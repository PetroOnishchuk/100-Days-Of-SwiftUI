//
//  AstronautView.swift
//  Accessibility
//
//  Created by Petro Onishchuk on 3/22/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astrounaut
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
                    }
                   
                }
            }
            .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
            
        }
        
        init(astronaut: Astrounaut, missions: [Mission]) {
            self.astronaut = astronaut
            self.missions = missions
            
            var matches = [Mission]()
            
            for mission in missions {
                if let match = mission.crew.first(where: {$0.name == self.astronaut.id}) {
                    matches.append(mission)
                }
            }
            self.missions = matches
        }
    }

    struct AstronautView_Previews: PreviewProvider {
        static let astronauts: [Astrounaut] = Bundle.main.decode("astronauts.json")
        static let missions: [Mission] = Bundle.main.decode("missions.json")
        static var previews: some View {
            AstronautView(astronaut: astronauts[0], missions: missions)
        }
    }
