//
//  HidingAndGrouping.swift
//  Accessibility
//
//  Created by Petro Onishchuk on 3/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct HidingAndGrouping: View {
    var body: some View {
        VStack {
            Text("You score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
    .accessibility(label: Text("Your score is 1000"))
    }
}

struct HidingAndGrouping_Previews: PreviewProvider {
    static var previews: some View {
        HidingAndGrouping()
    }
}
