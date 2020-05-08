//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Petro Onishchuk on 5/7/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI



struct ResortView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @EnvironmentObject var favorites: Favorites
    
    
    let resort: Resort
    
    @State private var selectedFacility: Facility?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                Group {
                    HStack {
                        if sizeClass == .compact {
                            Spacer()
                            VStack { ResortDetailsView(resort: resort) }
                            VStack { SkiDetailsView(resort: resort)}
                            Spacer()
                        } else {
                            ResortDetailsView(resort: resort)
                            Spacer().frame(height: 0)
                            SkiDetailsView(resort: resort)
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
                    Text(resort.description)
                        .padding()
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    //Text(resort.facilities.joined(separator: ", "))
//                        Text(ListFormatter.localizedString(byJoining: resort.facilities))
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    self.selectedFacility = facility
                            }
                           
                        }
                    }
                        .padding(.vertical)
                }
                .padding(.horizontal)
                
            }
            Button(action: {
                if self.favorites.contains(self.resort) {
                    self.favorites.remove(self.resort)
                } else {
                    self.favorites.add(self.resort)
                }
            }) {
                Text(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites")
            }
        }
            
        .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
        .alert(item: $selectedFacility) { (facility) -> Alert in
            facility.alert
                                   }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
    }
}
