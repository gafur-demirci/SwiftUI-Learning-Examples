//
//  MapData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 17.12.2024.
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

@Observable class MapData {
    var cameraPos: MapCameraPosition
//    var cameraBounds: MapCameraBounds
    var listLocations: [PlaceMarker] = []
    
    init() {
        let coordinates = CLLocationCoordinate2D(latitude: 40.7637825011971, longitude: -73.9731328627541)
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        cameraPos = MapCameraPosition.region(region)
//        cameraBounds = MapCameraBounds(centerCoordinateBounds: region, minimumDistance: 200, maximumDistance: 1000)
    }
}
