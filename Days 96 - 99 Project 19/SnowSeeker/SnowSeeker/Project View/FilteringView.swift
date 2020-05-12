//
//  FilteringView.swift
//  SnowSeeker
//
//  Created by Petro Onishchuk on 5/11/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI


//MARK: Day 99. Challenge 3.8
struct FilteringView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let countriesArray = ["All", "United States", "Italy", "France", "Canada", "Austria"]
    let sizesArray = ["All", "Small", "Average", "Large"]
    let pricesArray = ["All", "$", "$$", "$$$"]
    
    @Binding var countryForFiltering: String
    @Binding var sizeForFiltering: Int
    @Binding var priceForFiltering: Int
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select country for filtering: ")) {
                    Picker(selection: $countryForFiltering, label: Text("Select country for filtering: ")) {
                        ForEach(countriesArray) { country in
                            Text("\(country)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .colorMultiply(Color.red)
                }
                Section(header: Text("Select size for filtering")) {
                    Picker(selection: $sizeForFiltering
                    , label: Text("Select size for filtering")) {
                        ForEach(0 ..< self.sizesArray.count) { number in
                            Text("\(self.sizesArray[number])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .colorMultiply(Color.green)
                }
                Section(header: Text("Select price for filtering: ")) {
                    Picker(selection: $priceForFiltering, label: Text("Select price for filtering")) {
                        ForEach(0 ..< self.pricesArray.count){ number in
                            Text("\(self.pricesArray[number])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .colorMultiply(Color.orange)
                }
                
            }
            .navigationBarItems(trailing: Button(action: {
                self.dismiss()
            }, label: {
                Text("Done")
            }))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

//struct FilteringView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteringView()
//    }
//}
