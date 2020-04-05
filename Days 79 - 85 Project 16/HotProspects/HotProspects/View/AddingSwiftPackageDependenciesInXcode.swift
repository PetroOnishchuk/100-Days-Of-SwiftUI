//
//  AddingSwiftPackageDependenciesInXcode.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/5/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct AddingSwiftPackageDependenciesInXcode: View {
   let possinleNumber = Array(1...60)
    
    var results: String {
        // more code to come
        let selected = possinleNumber.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
       Text(results)
     
    }
}

struct AddingSwiftPackageDependenciesInXcode_Previews: PreviewProvider {
    static var previews: some View {
        AddingSwiftPackageDependenciesInXcode()
    }
}
