//
//  Mission.swift
//  Accessibility
//
//  Created by Petro Onishchuk on 3/22/20.
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
            return " Date: N/A"
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
    
    // Day 76. Project 15. Challenge 3
    var accessibleLaunchDate: String {
        formattedLaunchDate.replacingOccurrences(of: "Date: N/A", with: "Date is not found")
    }
}







