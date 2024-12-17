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
            MapCircle(center: coordinates, radius: 100)
                .foregroundStyle(Color.red)
                .mapOverlayLevel(level: .aboveRoads) // if you want to under the labels for MapCircle, you dont use it modifier
        }
    }
}

#Preview {
    MapViewExample()
        .environment(MapData())
}
