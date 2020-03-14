//
//  Result.swift
//  BucketList
//
//  Created by Petro Onishchuk on 3/14/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
