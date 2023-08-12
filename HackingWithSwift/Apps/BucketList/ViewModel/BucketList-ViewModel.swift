//
//  BucketList-ViewModel.swift
//  HackingWithSwift
//
//  Created by Justin Grimes on 8/12/23.
//  Copyright © 2023 Justin Grimes.
//  All Rights Reserved.
//
  

import MapKit
import LocalAuthentication
import Foundation

extension BucketListView {
    // UI updates MUST happen on the MainActor
    // Just to be safe, whenever you have a class that
    // conforms to the ObservableObject, just go ahead
    // and add the @MainActor attribute
    @MainActor class BucketListViewModel: ObservableObject {
        // The starting map location
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 50), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        
        // Only the class itself can write to locations, but anyone can read it
        @Published private(set) var locations: [Location]
        // Variable to track if a location has been selected
        @Published var selectedPlace: Location?
        @Published var isUnlocked = false
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation() {
            // Create a new copy of the location
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            
            // Add the new location to the locations array
            locations.append(newLocation)
            
            // Try to save the locations array to a file
            save()
        }
        
        
        func updateLocation(for location: Location) {
            guard let selectedPlace = selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                
                // Try to save the locations array to a file
                save()
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                // Device has biometrics capability
                let reason = "Please authenticate yourself to unlock your bucket list places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        // Was successfully authenticated
                        
                        // .evaluationPolicy is handled by Apple, generally in a background task
                        // as it turns on FaceID and then authenticate.
                        // This can cause a problem when we are updating the UI based on that,
                        // which may or may not be on the MainActor, so we need to start a new
                        // task to make sure we're changing the value that controls the UI on the MainActor
                        Task { @MainActor in
                            self.isUnlocked = true
                        }
                    } else {
                        // Error authenticating
                    }
                }
            } else {
                // No biometrics available
            }
        }
    }
}
