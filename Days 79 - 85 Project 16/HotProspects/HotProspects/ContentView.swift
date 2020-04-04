//
//  ContentView.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

struct ContentView: View {
   
  
    
    var body: some View {
       Text("Hello, Word!")
        .onAppear{
            let url = URL(string: "https://www.apple.com")!
            URLSession.shared.dataTask(with: url) {
                data, response, error in
                if data != nil {
                    print("We got data!")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }
    
    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        completion(.failure(.badURL))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
