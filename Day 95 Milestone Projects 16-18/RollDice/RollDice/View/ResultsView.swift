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
    
    
    @State private var countOfDie = 1
   
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                
            List {
                
                ForEach(results, id: \.wrappedId) { result in
                    HStack {
                        
                        HStack {
                            
                            DieView(die: self.findDiceIndex(at: result) + 1, width: 25, height: 25, cornerRadius: 6, backgroundColor: .black)
                        ForEach(result.dicesArray, id: \.result) { newDie in
                            
                            DieView(die: newDie.wrappedResult, width: 58, height: 58, cornerRadius: 6, backgroundColor: .yellow)
                            
                        }
                        //
                    }
                       Spacer()
                        
                        VStack() {
                            
                            HorizontalText(text: "Result:", textResult: "\(result.wrappedTotalResult)", fontSize: 20, textResultWidth: 70, resultsWidth: 55, textColor: .green, resultColor: .red)
                            
                            HorizontalText(text: "Date:", textResult: result.wrappedDate, fontSize: 10, textResultWidth: 30, resultsWidth: 85, textColor: .black, resultColor: .purple)
                        }
                            
                    }
                }
                .onDelete(perform: removeResult(at:))
                //
            }
           
                HorizontalText(text: "Number of result:", textResult: "\(results.count)", fontSize: 30, textResultWidth: 300, resultsWidth: 50, textColor: .green, resultColor: .red)
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
    
    func findDiceIndex(at result: Result) -> Int {
        guard let index = results.firstIndex(of: result) else { return 0 }
        let newIndex = results.firstIndex { (rst) -> Bool in
            rst == result
        }
        return index
    }
  
}

//struct ResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsView()
//    }
//}
