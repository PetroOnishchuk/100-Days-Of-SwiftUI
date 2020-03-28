//
//  ModifiersView.swift
//  PhotoAlbum
//
//  Created by Petro Onishchuk on 3/28/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

//struct ModifiersView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

//struct ModifiersView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModifiersView()
//    }
//}

struct DrawImageNameView: View {
    var text: String
    var textResults: String
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(Color.green)
                .modifier(drawText())
            
            Text(textResults)
            .modifier(drawText())
                .foregroundColor(Color.red)
        }
    }
}


struct drawText: ViewModifier {
    let font = Font.system(size: 22, weight: .heavy, design: .default)
    
    func body(content: Content) -> some View {
        content
            .font(font)
        
    }
}
