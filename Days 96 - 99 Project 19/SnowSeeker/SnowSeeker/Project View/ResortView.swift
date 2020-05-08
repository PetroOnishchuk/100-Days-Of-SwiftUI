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
    
    let resort: Resort
    
    @State private var selectedFacility: String?
    
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
                        ForEach(resort.facilities, id: \.self) { facility in
                            Facility.icon(for: facility)
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
        }
        .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
    }
}
