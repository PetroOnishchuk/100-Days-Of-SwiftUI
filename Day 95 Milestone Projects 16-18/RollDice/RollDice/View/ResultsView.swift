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
                    //VStack {
                        HStack {
                            ForEach((0..<result.wrappedNumbersOfDice)) { number in
                                DrawDiceView(dice: result.dicesArray[number].wrappedResult, width: 44, height: 44, cornerRadius: CGFloat(6))
                            }
                            Text("Result: \(result.wrappedTotalResult)")
                                .font(.largeTitle)
                           
                        }
                        
                        
                    //}
                    
                }
            .onDelete(perform: removeResult(at:))
            //delete
            }
        .navigationBarTitle(Text("Roll Dice Results"))
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
