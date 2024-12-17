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
    
    var body: some View {
        Map(position: Bindable(mapData).cameraPos) {
            Marker("Dikili Taş", coordinate: coordinates)
                .tint(.blue)
        }
    }
}

#Preview {
    MapViewExample()
        .environment(MapData())
}
