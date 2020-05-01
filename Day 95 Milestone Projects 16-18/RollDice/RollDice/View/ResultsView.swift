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
    
   
    
    var body: some View {
        NavigationView {
            List {
                ForEach(results, id: \.wrappedId) { result in
                    HStack {
                        ForEach(result.dicesArray, id: \.result) { newDie in
                            DieView(die: newDie.wrappedResult, width: 58, height: 58, cornerRadius: 6)
                        }
                       Spacer()
                        VStack {
                        HorizontalText(text: "Result:", textResult: "\(result.wrappedTotalResult)", fontSize: 20, resultsWidth: 55)
                            Text("\(result.wrappedDate)")
                        }
                    }
                }
                .onDelete(perform: removeResult(at:))
            }
            .navigationBarTitle(Text("Roll Dice Results"))
        }
    .navigationViewStyle(StackNavigationViewStyle())
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
