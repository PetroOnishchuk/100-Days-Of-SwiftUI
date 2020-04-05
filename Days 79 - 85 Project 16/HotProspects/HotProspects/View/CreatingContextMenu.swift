//
//  CreatingContextMenu.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/5/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct CreatingContextMenu: View {
     @State private var backgroundColor = Color.red
        
        
        var body: some View {
            VStack {
                Text("Hello World!")
                .padding()
                .background(backgroundColor)
                
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button(action: {
                        self.backgroundColor = .red
                    }) {
                        Text("Red")
                        Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.red)
                    }
                    
                    Button(action: {
                        self.backgroundColor = .green
                    }) {
                        Text("Green")
                    }
                    
                    Button(action: {
                        self.backgroundColor = .blue
                    }) {
                        Text("Blue")
                    }
                }
            }
         
        }
       
    }
struct CreatingContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        CreatingContextMenu()
    }
}
