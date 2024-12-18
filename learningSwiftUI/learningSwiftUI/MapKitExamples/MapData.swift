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

class Coordinate {
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

@Observable class MapData {
    var cameraPos: MapCameraPosition
//    var cameraBounds: MapCameraBounds
    var listLocations: [PlaceMarker] = []
    var origin: Coordinate
    var destination: Coordinate
    
    init(origin: Coordinate, destination: Coordinate) {
        self.origin = origin
        self.destination = destination
        
        let coordinates = CLLocationCoordinate2D(latitude: origin.latitude, longitude: origin.longitude)
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        cameraPos = MapCameraPosition.region(region)
//        cameraBounds = MapCameraBounds(centerCoordinateBounds: region, minimumDistance: 200, maximumDistance: 1000)
    }
}
