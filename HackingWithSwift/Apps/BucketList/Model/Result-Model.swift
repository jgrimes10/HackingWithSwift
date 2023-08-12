//
//  Result-Model.swift
//  HackingWithSwift
//
//  Created by Justin Grimes on 8/12/23.
//  Copyright © 2023 Justin Grimes.
//  All Rights Reserved.
//
  

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    var description: String {
        terms?["description"]?.first ?? "No further information"
    }
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}
