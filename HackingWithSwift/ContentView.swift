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
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
