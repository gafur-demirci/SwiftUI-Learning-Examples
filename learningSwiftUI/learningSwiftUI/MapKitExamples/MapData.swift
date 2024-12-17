//
//  MapData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 17.12.2024.
//

import SwiftUI
import Observation
import MapKit

@Observable class MapData {
    var cameraPos: MapCameraPosition
    
    init() {
        let coordinates = CLLocationCoordinate2D(latitude: 41.008, longitude: 28.978)
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        cameraPos = MapCameraPosition.region(region)
    }
}
