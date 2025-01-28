//
//  mapView.swift
//  TravelBook
//
//  Created by Abdulgafur Demirci on 19.01.2025.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct mapView: View {
    
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
    mapView()
        .environment(MapData())
}
