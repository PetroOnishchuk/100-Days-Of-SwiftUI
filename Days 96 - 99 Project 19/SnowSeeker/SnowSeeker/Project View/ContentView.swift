//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Petro Onishchuk on 5/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

//MARK: Day 99. Challenge 3.1. Create enum SortingType
enum SortingType {
       case none
       case alphabetical
       case country
   }



struct ContentView: View {
    @ObservedObject var favorites = Favorites()
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
  
    @State private var countryForFiltering = "All"
    @State private var sizeForFiltering = 0
    @State private var priceForFiltering = 0
    
    //MARK: Day 99. Challenge 3.2
    @State private var sortingType = SortingType.none
    
    
    //MARK: Day 99. Challenge 3.3
    var sortedResorts: [Resort] {
        switch sortingType {
        case .none:
            return resorts
        case .alphabetical:
            return resorts.sorted { (firstResort, secondResort) -> Bool in
                firstResort.id < secondResort.id
            }
        case .country:
            return resorts.sorted { (firstResort, secondResort) -> Bool in
                firstResort.country > secondResort.country
            }
        }
    }
    
    //MARK: Day 99. Challenge 3.4
    var filteredResorts: [Resort] {
        var tempResorts = sortedResorts
        
        tempResorts = tempResorts.filter { (resort) -> Bool in
            resort.country == self.countryForFiltering || self.countryForFiltering == "All"
        }
        
        tempResorts = tempResorts.filter { (resort) -> Bool in
            resort.size == self.sizeForFiltering || self.sizeForFiltering == 0
        }
        
       tempResorts = tempResorts.filter { (resort) -> Bool in
            resort.price == self.priceForFiltering || self.priceForFiltering == 0
        }
        
      
        return tempResorts
    }
    
    //MARK: Day 99. Challenge 3.5
    @State private var isShowingSortingSheet = false
    @State private var isShovingFilteringSheet = false
    
    
    var body: some View {
        NavigationView {
            //MARK: Day 99. Challenge 3.6
            List(filteredResorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5)
                    )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                    )
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(1)
                    if self.favorites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .accessibility(label: Text("This is a favorite resort"))
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("Resorts")
            .navigationBarItems(leading: Button(action: {
                self.isShovingFilteringSheet.toggle()
            }, label: {
                Text("Filtering")
            }), trailing: Button(action: {
                self.isShowingSortingSheet.toggle()
            }, label: {
                Text("Sorting")
            }))
                //MARK: Day 99. Challenge 3.9
                .sheet(isPresented: $isShovingFilteringSheet) {
                    FilteringView(countryForFiltering: self.$countryForFiltering, sizeForFiltering: self.$sizeForFiltering, priceForFiltering: self.$priceForFiltering)
                }
                //MARK: Day 99. Challenge 3.7
                .actionSheet(isPresented: $isShowingSortingSheet) { () -> ActionSheet in
                    ActionSheet(title: Text("Select type of sorted"), message: nil, buttons: [.default(Text("Alphabetical"), action: {
                        self.sortingType = .alphabetical
                    }), .default(Text("By Country"), action: {
                        self.sortingType = .country
                    }), .default(Text("Default"), action: {
                        self.sortingType = .none
                    }), .destructive(Text("Cancel"))])
            }
            
            
            WelcomeView()
            
        }
        .environmentObject(favorites)
        //.phoneOnlyStackNavigationView()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
