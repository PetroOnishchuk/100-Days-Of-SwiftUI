//
//  WritingDataToTheDocumentsDerectory.swift
//  BucketList
//
//  Created by Petro Onishchuk on 3/12/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct WritingDataToTheDocumentsDerectory: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                let str = "Test Message"
                let url = self.getDocumentDirectory().appendingPathComponent("message.txt")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
        }
    }
    

    func getDocumentDirectory() -> URL {
        // find all possible decoments directory for thie user
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return path[0]
    }
}



struct WritingDataToTheDocumentsDerectory_Previews: PreviewProvider {
    static var previews: some View {
        WritingDataToTheDocumentsDerectory()
    }
}
