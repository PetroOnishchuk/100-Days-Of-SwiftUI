//
//  ContentView.swift
//  Moonshot
//
//  Created by Petro Onishchuk on 2/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    let astronauts: [Astrounaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: Text("Detail view")) {
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
        .navigationBarTitle("Moonshot")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
