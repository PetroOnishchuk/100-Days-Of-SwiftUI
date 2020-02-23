//
//  EmojiRaitingView.swift
//  Bookworm
//
//  Created by Petro Onishchuk on 2/22/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct EmojiRaitingView: View {
    let rating: Int16
    
    
    var body: some View {
        switch rating {
        case 1:
            return Text("1")
        case 2:
            return Text("2")
        case 3:
            return Text("3")
        case 4:
            return Text("4")
        default:
            return Text("5")
        }
    }
}

struct EmojiRaitingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRaitingView(rating: 3)
    }
}
