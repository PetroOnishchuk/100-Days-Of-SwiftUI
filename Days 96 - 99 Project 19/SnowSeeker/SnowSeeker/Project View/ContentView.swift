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



struct ContentView: View {
    @ObservedObject var favorites = Favorites()
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    
    
    enum SortingType {
        case none
        case alphabetical
        case country
    }
    
    enum FilteringType {
        case country
        case size
        case price
    }
    
    
    let countries = ["United States", "Italy", "France", "Canada", "Austria"]
    let sizes = ["Small", "Average", "Large"]
    let prices = ["$", "$$", "$$$"]
    
    @State private var countryFiltering = "United States"
    @State private var sizeFiltering = 0
    @State private var priceFiltering = 3
    
    @State private var sortingType = SortingType.country
    
    
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
    
    var filteredResorts: [Resort] {
        var tempResorts = sortedResorts
        
        tempResorts = tempResorts.filter { (resort) -> Bool in
            resort.country == self.countryFiltering || self.countryFiltering == "all"
        }
        
        tempResorts = tempResorts.filter { (resort) -> Bool in
            resort.size == self.sizeFiltering || self.sizeFiltering == 0
        }
        
       tempResorts = tempResorts.filter { (resort) -> Bool in
            resort.price == self.priceFiltering || self.priceFiltering == 0
        }
        
      
        return tempResorts
    }
    
    @State private var isShowingSortedSheet = false
    
    
    
    var body: some View {
        NavigationView {
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
            .navigationBarItems(trailing: Button(action: {
                self.isShowingSortedSheet.toggle()
            }, label: {
                Text("Sorting")
            }))
                .actionSheet(isPresented: $isShowingSortedSheet) { () -> ActionSheet in
                    ActionSheet(title: Text("Select type of sorted"), message: nil, buttons: [.default(Text("Alphabetical"), action: {
                        self.sortingType = .alphabetical
                    }), .default(Text("By Country"), action: {
                        self.sortingType = .country
                    }), .default(Text("Default"), action: {
                        self.sortingType = .none
                    }), .destructive(Text("Cancel"))])
            }
            //            .alert(isPresented: $isShowingSortedSheet) { () -> Alert in
            //                Alert(title: Text("Text"), message: nil, dismissButton: .cancel())
            //            }
            //
            
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
