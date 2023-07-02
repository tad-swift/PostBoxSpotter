//
//  ContentView-ViewModel.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 15/05/2023.
//

import Foundation
import LocalAuthentication
import MapKit
import CoreLocation

extension ContentView {
    class ViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
        private let locationManager = CLLocationManager()
        
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published private(set) var locations: [Location]
        @Published var selectedPlace: Location?
        @Published var isUnlocked = false
        
        
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        
        override init() {
            mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
            
            super.init() // Call the superclass's init method
            
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            //locationManager.startUpdatingLocation()
        

        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let userLocation = locations.first else { return }
            mapRegion = MKCoordinateRegion(center: userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }

        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Location manager error: \(error.localizedDescription)")
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
            let newLocation = Location(id: UUID(), name: "New location", description: "", selectedCypher: .EREdward, latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace = selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func centerOnUserLocation() {
                    guard let userLocation = locationManager.location?.coordinate else { return }
                    let region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                    mapRegion = region
                }
        

    }
}




