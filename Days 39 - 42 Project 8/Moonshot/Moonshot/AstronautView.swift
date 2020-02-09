//
//  AstronautView.swift
//  Moonshot
//
//  Created by Petro Onishchuk on 2/9/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astrounaut
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                Image(self.astronaut.id)
                .resizable()
                .scaledToFit()
                    .frame(width: geometry.size.width)
                
                Text(self.astronaut.description)
                .padding()
               
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
        
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astrounaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
