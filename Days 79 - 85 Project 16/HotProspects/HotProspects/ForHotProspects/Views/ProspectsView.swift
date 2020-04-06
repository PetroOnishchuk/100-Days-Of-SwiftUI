//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ProspectsView: View {
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    
    @EnvironmentObject var prospects: Prospects
    
    var title: String {
        switch filter {
        case .none:
            return "Evetyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
            
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { (prospect) -> Bool in
                prospect.isContacted
            }
        case .uncontacted:
            return prospects.people.filter { (prospect) -> Bool in
                !prospect.isContacted
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(filteredProspects) { prospect in
                    VStack(alignment: .leading, spacing: nil) {
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                    }
                }
            }
                
                
                
                .navigationBarTitle(title)
                .navigationBarItems(trailing: Button(action: {
                    let prospect = Prospect()
                    prospect.name = "Paul Hudson"
                    prospect.emailAddress = "paul@hackingwithswift.com"
                    self.prospects.people.append(prospect)
                }, label: {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                }))
        }
        
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
