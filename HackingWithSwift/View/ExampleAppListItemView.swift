//
//  ExampleAppListItemView.swift
//  HackingWithSwift
//
//  Created by Justin Grimes on 8/11/23.
//  Copyright © 2023 Justin Grimes.
//  All Rights Reserved.
//
  

import SwiftUI

struct ExampleAppListItemView: View {
    // MARK: - PROPERTIES
    var name: String
    var icon: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.blue)
                    .frame(width: 64, height: 64)
                
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            
            Text(name)
                .font(.title)
                .padding(.horizontal)
        }
        .padding(.vertical, 4)
    }
}

// MARK: - PREVIEW
struct ExampleAppListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAppListItemView(name: "Test App", icon: "testtube.2")
    }
}
