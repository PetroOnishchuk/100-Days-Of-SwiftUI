//
//  AlertAndSheetOptionals.swift
//  SnowSeeker
//
//  Created by Petro Onishchuk on 5/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}



struct AlertAndSheetOptionals: View {
      
      @State private var selectedUser: User? = nil
      @State private var isShowingAlert = false
      
      
      var body: some View {
          Text("Hello, Word!")
              .onTapGesture {
                  self.selectedUser = User()
                  self.isShowingAlert = true
          }
          .alert(isPresented: $isShowingAlert) { () -> Alert in
              Alert(title: Text(selectedUser!.id))
          }
          //.alert(item: $selectedUser) { (user) -> Alert in
             // Alert(title: Text(selected.id))
         // }
      
      }
}

struct AlertAndSheetOptionals_Previews: PreviewProvider {
    static var previews: some View {
        AlertAndSheetOptionals()
    }
}
