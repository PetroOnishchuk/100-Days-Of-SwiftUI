//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Petro Onishchuk on 2/18/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

class User: ObservableObject, Codable {
    @Published var name = "Paul Hudson"
    
    
    enum CodingKeys: CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct Response: Codable {
    var results: [Result]
    
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct ContentViewPrevious: View {
    @State private var results = [Result]()

    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }.onAppear(perform: loadData)
    }
    
    func loadData() {
        // step 1
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        // step 2
        let request = URLRequest(url: url)
        
        // step 3
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            // step 4
            if let data = data {
                if let decodedResponse  = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data - go back to the main  thread
                    DispatchQueue.main.async {
                        // update our UI
                        print("\(String(data: data, encoding: .utf8))")
                        self.results = decodedResponse.results
                    }
                    // everthing is good, so we can exit
                    return
                }
            }
            // if we're still here it means there was a problem
            print("Fetch failse: \(error?.localizedDescription ?? "Unknow error")")
        }.resume()
    }
}


struct ContentView: View {
    @State private var username = ""
    @State private var email = ""

    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account")
                }
            }.disabled(disableForm)
        }
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
