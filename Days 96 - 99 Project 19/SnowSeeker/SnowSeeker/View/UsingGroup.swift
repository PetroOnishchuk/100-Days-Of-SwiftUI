//
//  UsingGroup.swift
//  SnowSeeker
//
//  Created by Petro Onishchuk on 5/6/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Aura, and Toby")
        }
    }
}

struct UsingGroup: View {
    @Environment(\.horizontalSizeClass) var sizeClass
        
        @State private var layoutVertically = false
        
        var body: some View {
            //V.1
    //        Group {
    //            if layoutVertically {
    //                VStack {
    //                    UserView()
    //                }
    //            } else {
    //                HStack {
    //                    UserView()
    //                }
    //            }
    //        }
    //        .onTapGesture {
    //            self.layoutVertically.toggle()
    //        }
         //   V.2
            Group {
                if sizeClass == .compact {
                         VStack {
                             UserView()
                         }
                     } else {
                         HStack {
                             UserView()
                         }
                     }
                 }
           //  V.3 Don't Work
    //        Group {
    //        if sizeClass == .compact {
    //           return  VStack(content: UserView.init)
    //        } else {
    //            return HStack(content: UserView.init)
    //        }
    //
    //        }
        }
}

struct UsingGroup_Previews: PreviewProvider {
    static var previews: some View {
        UsingGroup()
    }
}
