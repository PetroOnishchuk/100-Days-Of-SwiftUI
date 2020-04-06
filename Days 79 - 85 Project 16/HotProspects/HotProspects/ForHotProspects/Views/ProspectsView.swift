//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import CodeScanner


struct ProspectsView: View {
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    
    @EnvironmentObject var prospects: Prospects
    
    @State private var isShowingScanner = false
    
    var title: String {
        switch filter {
        case .none:
            return "Evetyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
            
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { (prospect) -> Bool in
                prospect.isContacted
            }
        case .uncontacted:
            return prospects.people.filter { (prospect) -> Bool in
                !prospect.isContacted
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(filteredProspects) { prospect in
                    VStack(alignment: .leading, spacing: nil) {
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                    }
                }
            }
                
                
                
                .navigationBarTitle(title)
                .navigationBarItems(trailing: Button(action: {
                    self.isShowingScanner = true
                    
                }, label: {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                }))
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: self.handleScan(result:))
            }
        }
        
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false
        // more code to come
        switch result {
        case .success(let code):
            let details = code.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress  = details[1]
            
            self.prospects.people.append(person)
        case .failure(let error):
            print("Scanning failed")
        
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
