//
//  ContentView.swift
//  Moonshot
//
//  Created by Petro Onishchuk on 2/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct User: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

struct ContentView: View {
    var body: some View {
        
        
        Button("Decode JSON") {
            let input = """
                { "name": "Taylor Swift",
                "address": {
                "street": "555, Taylor Swift Avenue",
                "city":"Nashville"
                }

                }
                """
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
