//
//  ReadingTheValueOfControls.swift
//  Accessibility
//
//  Created by Petro Onishchuk on 3/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct ReadingTheValueOfControls: View {
    
    @State private var estimate = 25.0
    
    @State private var rating = 3
    
    var body: some View {
        VStack {
        Slider(value: $estimate, in: 0...50)
        .padding()
        .accessibility(value: Text("\(Int(estimate))"))
        
            Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5)
            .accessibility(value: Text("\(rating) out of 5"))
        }
    }
}

struct ReadingTheValueOfControls_Previews: PreviewProvider {
    static var previews: some View {
        ReadingTheValueOfControls()
    }
}
