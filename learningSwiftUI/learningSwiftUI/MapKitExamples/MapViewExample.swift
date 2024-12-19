//
//  MapViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 16.12.2024.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapViewExample: View {
    
    @Environment(MapData.self ) private var mapData
    
    var body: some View {
        Map(position: Bindable(mapData).cameraPos) {
            if mapData.isAuthorized {
                UserAnnotation()
            }
        }
        .mapControls {
            if mapData.isAuthorized {
                MapUserLocationButton()
            }
        }
        .safeAreaInset(edge: .bottom, content: {
            LocationButton(.currentLocation) {
                mapData.cameraPos = .userLocation(fallback: .automatic)
            }
            .padding()
        })
    }
}

#Preview {
    MapViewExample()
        .environment(MapData())
}
