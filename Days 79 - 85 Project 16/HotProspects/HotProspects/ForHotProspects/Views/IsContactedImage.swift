//
//  IsContactedImage.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/7/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import SwiftUI

struct IsContactedImage: View {
    
    var isContacted: Bool
    
    var body: some View {
        Image(systemName: isContacted ? "person.crop.circle.badge.checkmark" :"person.crop.circle.badge.minus" )
        .font(.system(size: 29))
        .foregroundColor(isContacted ? .green : .red)
    }
}

