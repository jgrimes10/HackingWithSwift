//
//  FileManager-DocumentsDirectory.swift
//  HackingWithSwift
//
//  Created by Justin Grimes on 8/12/23.
//  Copyright © 2023 Justin Grimes.
//  All Rights Reserved.
//
  

import SwiftUI

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
