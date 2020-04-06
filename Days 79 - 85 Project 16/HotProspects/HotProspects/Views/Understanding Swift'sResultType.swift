//
//  Understanding Swift'sResultType.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/5/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

struct Understanding_Swift_sResultType: View {
   
  
    
    var body: some View {
       Text("Hello, Word!")
        .onAppear{
            self.fetchData(from: "https://www.apple.com") { (result) in
                switch result {
                case .success(let str):
                    print(str)
                case .failure(let error):
                    switch error {
                    case .badURL:
                        print("Bad URL")
                    case .requestFailed:
                        print("Network problems")
                    case .unknown:
                        print("Unknown error")
                
                    }
                }
            }

        }
    }
    
    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        // check the URL is OK, otherwise return  with failure
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            // the task has completed - push our work back to the main thread
            DispatchQueue.main.async {
                if let data = data {
                    // success: convert the data to a string and send it back
                    let stringData = String(decoding: data, as: UTF8.self)
                    completion(.success(stringData))
                } else if error != nil {
                    // any sort of network failure
                    completion(.failure(.requestFailed))
                } else {
                    // this ought not to be possible, yet here we are
                    completion(.failure(.unknown))
                }
            }
        }.resume()
        
    }
}

struct Understanding_Swift_sResultType_Previews: PreviewProvider {
    static var previews: some View {
        Understanding_Swift_sResultType()
    }
}
