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
    
    @FetchRequest(entity: Result.entity(), sortDescriptors: []) var results: FetchedResults<Result>
    
    
    var body: some View {
          List {
                      ForEach(results, id: \.wrappedId) { result in
                          VStack {
                          Text("Result \(result.wrappedTotalResult)")
                              Text("Dices: \(result.dicesArray[0].wrappedResult)")
                          }
                          
                      }
                  }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
