//
//  MapData.swift
//  TravelBook
//
//  Created by Abdulgafur Demirci on 22.01.2025.
//

import SwiftUI
import Observation
import MapKit

struct PlaceMarker: Identifiable {
    var id: UUID = UUID()
    var name: String
    var location: CLLocationCoordinate2D
    
    init(id: UUID, name: String, location: CLLocationCoordinate2D) {
        self.id = id
        self.name = name
        self.location = location
    }
}

class Coordinate {
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

@Observable class MapData: NSObject, CLLocationManagerDelegate {
    var cameraPos: MapCameraPosition

    var listLocations: [PlaceMarker] = []

    var isAuthorized: Bool = false
    @ObservationIgnored let manager = CLLocationManager()
    
    override init() {

        let coordinates = CLLocationCoordinate2D(latitude: 40.7637825011971, longitude: -73.9731328627541)
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        cameraPos = MapCameraPosition.region(region)
        
        super.init()
        manager.delegate = self
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkStatus()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        checkStatus()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
    
    func checkStatus() {
        if manager.authorizationStatus == .authorizedWhenInUse {
            isAuthorized = true
        } else if manager.authorizationStatus == .denied {
            isAuthorized = false
        }
    }
}
