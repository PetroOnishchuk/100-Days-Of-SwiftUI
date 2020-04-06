//
//  SchedulingLocalNotifications.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/5/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI
import UserNotifications

struct SchedulingLocalNotifications: View {
    var body: some View {
        VStack {
                   Button(action: {
                       UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
                           if success {
                               print("All set!")
                           } else if let error  = error{
                               print(error.localizedDescription)
                           }
                       }
                   }) {
                       Text("Request Permission")
                   }
                   
                   Button(action: {
                       let content = UNMutableNotificationContent()
                       content.title = "Feed the cat"
                       content.subtitle = "It looks hungry"
                       content.sound = UNNotificationSound.default
                       
                       // show thi notification five seconds from now
                       let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                       
                       // shoose a random identifier
                       let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                       
                       // ad our ntification request
                       UNUserNotificationCenter.current().add(request) { (error) in
                           print("Completion hundler in NotificationCenter")
                       }
                   }) {
                       Text("Schedule Notification")
                   }
               }
    }
}

struct SchedulingLocalNotifications_Previews: PreviewProvider {
    static var previews: some View {
        SchedulingLocalNotifications()
    }
}
