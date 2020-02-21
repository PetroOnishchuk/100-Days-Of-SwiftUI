//
//  ContentView.swift
//  Bookworm
//
//  Created by Petro Onishchuk on 2/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment( \.managedObjectContext) var moc
    
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    
    
    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.id) {
                    student in
                    Text(student.name ?? "Unknown")
                }
            }
            Button("Add") {
                 let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                   let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastNames = lastNames.randomElement()!
                
                //  more code to come
                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastNames)"
                
                try? self.moc.save()

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
