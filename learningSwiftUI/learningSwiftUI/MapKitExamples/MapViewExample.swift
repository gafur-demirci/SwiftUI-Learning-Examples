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
        Map(position: Bindable(mapData).cameraPos, bounds: mapData.cameraBounds) // min and max value areas can move to camera
    }
}

#Preview {
    MapViewExample()
        .environment(MapData())
}
