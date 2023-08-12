//
//  ExampleApp.swift
//  HackingWithSwift
//
//  Created by Justin Grimes on 8/11/23.
//  Copyright © 2023 Justin Grimes.
//  All Rights Reserved.
//
  

import SwiftUI

struct ExampleApp: Identifiable {
    let id: UUID
    let name: String
    let icon: String
    let destination: AnyView
    
    init(name: String, icon: String, destination: AnyView) {
        self.id = UUID()
        self.name = name
        self.icon = icon
        self.destination = destination
    }
}
