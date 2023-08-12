//
//  Location-Model.swift
//  HackingWithSwift
//
//  Created by Justin Grimes on 8/11/23.
//  Copyright © 2023 Justin Grimes.
//  All Rights Reserved.
//
  

import Foundation
import CoreLocation

struct Location: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = Location(id: UUID(), name: "Buckingham Palace", description: "Where Queen Elizabeth lived with her dorgies.", latitude: 51.501, longitude: -0.141)
    
    // If the id is the same, the entry is the same
    // No need for Swift to compare the other fields
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
