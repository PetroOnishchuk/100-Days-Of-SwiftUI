//
//  MultipleOptionsWithActionSheet.swift
//  Instafilter
//
//  Created by Petro Onishchuk on 3/7/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct MultipleOptionsWithActionSheet: View {
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
        .background(backgroundColor)
            .onTapGesture {
            self.showingActionSheet = true
        }
        .actionSheet(isPresented: $showingActionSheet) { () -> ActionSheet in
            ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
                .default(Text("Red"), action: {
                    self.backgroundColor = Color.red
                }),
                .default(Text("Green"), action: {
                    self.backgroundColor = Color.green
                }),
                .default(Text("Blue"), action: {
                    self.backgroundColor = Color.blue
                }),
                .cancel()
            ])
        }
    }
}

struct MultipleOptionsWithActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        MultipleOptionsWithActionSheet()
    }
}
