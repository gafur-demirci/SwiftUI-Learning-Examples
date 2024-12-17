//
//  MapViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 16.12.2024.
//

import SwiftUI
import MapKit

struct MapViewExample: View {
    
    @Environment(MapData.self ) private var mapData
    let coordinates = CLLocationCoordinate2D(latitude: 41.008, longitude: 28.978)
    let secondCoordinates = CLLocationCoordinate2D(latitude: 41.008, longitude: 28.980)
    
    var body: some View {
        Map(position: Bindable(mapData).cameraPos) {
            MapPolyline(coordinates: [coordinates, secondCoordinates])
                .stroke(.red, lineWidth: 5)
        }
    }
}

#Preview {
    MapViewExample()
        .environment(MapData())
}
