//
//  ReadingCustomValues.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/4/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct ReadingCustomValues: View {
    let user = User()
    
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
    .environmentObject(user)
    }
}

struct ReadingCustomValues_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
