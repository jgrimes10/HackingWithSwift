//
//  ContentView-ViewModel.swift
//  HackingWithSwift
//
//  Created by Justin Grimes on 8/11/23.
//  Copyright © 2023 Justin Grimes.
//  All Rights Reserved.
//
  

import SwiftUI

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var exampleApps: [ExampleApp] = [
            ExampleApp(name: "Bucket List", icon: "map.fill", destination: AnyView(BucketListView())),
            ExampleApp(name: "We Split", icon: "creditcard", destination: AnyView(WeSplitView()))
        ]
    }
}
