//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Petro Onishchuk on 2/24/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import CoreData



struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }
    
    // MARK: If i wanr delete singer from CoreData
    @Environment(\.managedObjectContext) var moc
    // this is our content closure; we'll call this once for each item in the  list
    
    let content: (T) -> Content
    
    var body: some View {
        List {
        ForEach(fetchRequest.wrappedValue, id: \.self) {
            singer in
            self.content(singer)
            }.onDelete(perform: removeSinger(at:))
    }
        
    }
    
    // MARK: Challenge 3.7. set parameter for : filteringType: FilterType
    // MARK: Challenge 1.3. Set type [NSSortDescriptor] to the parameter: sortDescriptors:
    init(filterKey: String, filterValue: String, sortDescriptors: [NSSortDescriptor], filteringType: FilterType, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(filteringType.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
    
        func removeSinger(at offsets: IndexSet) {
            for index in offsets {
                let singer = singers[index]
                moc.delete(singer)
                do {
                    try moc.save()
                } catch {
                    print("Error save after delete")
                }
                
            }
        }
    
    
}
