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
        .onAppear {
            mapData.manager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    MapViewExample()
        .environment(MapData())
}
