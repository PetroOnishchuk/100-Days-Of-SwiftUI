//
//  FilteringView.swift
//  SnowSeeker
//
//  Created by Petro Onishchuk on 5/11/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI



struct FilteringView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let countriesArray = ["United States", "Italy", "France", "Canada", "Austria", "All"]
    let sizesArray = ["Small", "Average", "Large"]
    let pricesArray = ["$", "$$", "$$$"]
    
    @Binding var countryForFiltering: String
    @Binding var sizeForFiltering: Int
    @Binding var priceForFiltering: Int
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select country for Filtering")) {
                    Picker(selection: $countryForFiltering, label: Text("Select country for filtering")) {
                        ForEach(countriesArray) { country in
                            Text("\(country)")
                        }
                    }
                }
                Section(header: Text("Test Data")) {
                    VStack {
                        Text("Country: \(self.countryForFiltering)")
                    }
                }
            }
        }
    }
}

//struct FilteringView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteringView()
//    }
//}
