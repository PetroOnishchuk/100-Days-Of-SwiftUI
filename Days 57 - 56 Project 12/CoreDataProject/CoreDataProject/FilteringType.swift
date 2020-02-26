//
//  FilteringType.swift
//  CoreDataProject
//
//  Created by Petro Onishchuk on 2/26/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation

enum FilterType: String, CaseIterable {
    case beginsWith = "BEGINSWITH"
    case beginsWithCaseInsensitive = "BEGINSWITH[c]"
    case contains = "CONTAINS"
    case containsWithCaseInsensitive = "CONTAINS[c]"
    case endsWith = "ENDSWITH"
    case endsWithCaseInsensitive = "ENDSWITH[c]"
}
