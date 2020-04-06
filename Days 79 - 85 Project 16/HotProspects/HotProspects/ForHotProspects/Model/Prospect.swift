//
//  Prospect.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI



class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
}

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}
