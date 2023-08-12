//
//  ContentView.swift
//  HackingWithSwift
//
//  Created by Justin Grimes on 8/11/23.
//  Copyright © 2023 Justin Grimes.
//  All Rights Reserved.
//
  

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @StateObject private var viewModel = ViewModel()
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List(viewModel.exampleApps) { example in
                NavigationLink(destination: example.destination) {
                    ExampleAppListItemView(name: example.name, icon: example.icon, color: example.color)
                }
            }
            .navigationTitle("Example Apps")
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
