//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import CodeScanner
import UserNotifications



struct ProspectsView: View {
    
    enum FilterType {
        case none, contacted, uncontacted
    }
 
    let filter: FilterType
    
    @EnvironmentObject var prospects: Prospects
    
    @State private var isShowingScanner = false
    
    @State private var isShowinSheet = false
    
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
    
    enum SortedType {
        case name, date
    }
    
    @State private var sortType = SortedType.name
    
    var sortedProspects: [Prospect] {
        switch sortType {
        case .name:
            return filteredProspects.sorted { (firstProspect, secondProspect) -> Bool in
                return firstProspect.name < secondProspect.name
            }
        case .date:
            return filteredProspects.sorted { (firstProspect, secondProspect) -> Bool in
                return firstProspect.dateAdded < secondProspect.dateAdded
            }
        }
    }
    
    var isSelectedName: String {
        if sortType == .name {
            return "✔️       "
        } else {
            return "        "
        }
    }
    
    var isSelectedDate: String {
           if sortType == .date {
               return "✔️       "
           } else {
               return "         "
           }
       }
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(sortedProspects) { prospect in
                    HStack {
                        IsContactedImage(isContacted: prospect.isContacted)
                    VStack(alignment: .leading, spacing: nil) {
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                        }
                    }.contextMenu {
                        Button(action: {
                            self.prospects.toggle(prospect)
                        }) {
                            Text(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted")
                        }
                        if !prospect.isContacted {
                            Button("Remind Me") {
                                self.addNotification(for: prospect)
                            }
                        }
                    }
                }
            }
                
                
                
            .navigationBarTitle(title)
            .navigationBarItems(leading: Button(action: {
                self.isShowinSheet = true
            }, label: {
                Text("Sorting")
            }), trailing: Button(action: {
                self.isShowingScanner = true
                
            }, label: {
                Image(systemName: "qrcode.viewfinder")
                Text("Scan")
            }))
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: self.handleScan(result:))
            }
            .actionSheet(isPresented: $isShowinSheet) { () -> ActionSheet in
                
                ActionSheet(title: Text("Sort By:"), message: nil,  buttons: [.default(Text("\(isSelectedName) Name"), action: {
                    self.sortType = .name
                }), .default(Text("\(isSelectedDate) Date Added"), action: {
                    self.sortType = .date
                }),
                    .cancel()])
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
            person.dateAdded = Date()
            
            
            //MARK: Save  to UserDefoults
            self.prospects.add(person)
            
            
            
        case .failure(let error):
            print("Scanning failed \(error.localizedDescription)")
            
        }
    }
    
    // MARK: addNotification func
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            var dateComponents = DateComponents()
            dateComponents.hour = 9
            
           // let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats:  false)
             let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request, withCompletionHandler: nil)
            
        }
        
        // more code to come
        center.getNotificationSettings { (setting) in
            if setting.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
