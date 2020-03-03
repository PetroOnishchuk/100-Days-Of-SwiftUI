//
//  ContentView.swift
//  UsersListCoreData
//
//  Created by Petro Onishchuk on 3/3/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var users: FetchedResults<User>
    
    
    
    var body: some View {
        NavigationView {
            List{
                ForEach(users, id: \.id) { user in
                       NavigationLink(destination: DetailUserView(user: user)) {
                                     Text("Name \(user.name ?? "Text")")
                                }
                    
                }.onDelete(perform: removeUser(at:))
            
                
            }
        }
            .onAppear {
                if self.users.isEmpty {
                    print("Users is empty \(self.users)")
                    Users.loadDataToCD(moc: self.moc)
                }
               
        }
    }
    
    func removeUser(at offsets: IndexSet) {
        for index in offsets {
            let user = users[index]
            moc.delete(user)
            
            do {
                try moc.save()
            } catch {
                print("Error save after delete")
            }
            
        }
        
//        for allu in users {
//            moc.delete(allu)
//
//        }
//        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
