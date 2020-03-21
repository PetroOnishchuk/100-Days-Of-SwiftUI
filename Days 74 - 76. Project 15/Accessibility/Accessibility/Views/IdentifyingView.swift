//
//  IdentifyingView.swift
//  Accessibility
//
//  Created by Petro Onishchuk on 3/21/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct IdentifyingView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
    "Tulips",
    "Frozen tree buds",
    "Sunflowers",
    "Firewords"]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    var body: some View {
        Image(pictures[selectedPicture])
        .resizable()
        .scaledToFit()
            .onTapGesture {
                self.selectedPicture = Int.random(in: 0...3)
        }
        .accessibility(label: Text(labels[selectedPicture]))
        .accessibility(addTraits: .isButton)
        .accessibility(removeTraits: .isImage)
    }
}

struct IdentifyingView_Previews: PreviewProvider {
    static var previews: some View {
        IdentifyingView()
    }
}
