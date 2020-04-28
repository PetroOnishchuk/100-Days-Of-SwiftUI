//
//  ResultsView.swift
//  RollDice
//
//  Created by Petro Onishchuk on 4/27/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ResultsView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Result.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Result.totalResult, ascending: false)]) var results: FetchedResults<Result>
    
    // var results: FetchedResults<Result>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(results, id: \.wrappedId) { result in
                    VStack {
                        Text("Result \(result.wrappedTotalResult)")
                        
                    }
                    
                }
            .onDelete(perform: removeResult(at:))
            //delete
            }
        }
    }
    
    func removeResult(at offsets: IndexSet) {
        for index in offsets {
            let result = results[index]
            moc.delete(result)
            do {
                try moc.save()
            } catch {
                print("Error with save after delete Result")
            }
        }
    }
}

//struct ResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsView()
//    }
//}
