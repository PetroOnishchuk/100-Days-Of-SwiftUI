//
//  Mission.swift
//  Moonshot
//
//  Created by Petro Onishchuk on 2/7/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation


struct Mission: Codable, Identifiable {
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    
    
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    var crewNames: String {
        var names = String()
        for i in crew {
            names += i.name + " "
        }
        return names.capitalized
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
}







