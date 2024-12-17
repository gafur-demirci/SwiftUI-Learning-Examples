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
        Map(position: Bindable(mapData).cameraPos)
            .safeAreaInset(edge: .bottom) {
                HStack {
                    if let region = mapData.cameraPos.region {
                        Text(String(region.center.latitude))
                        Text(String(region.center.longitude))
                    }
                }
                .padding([.top, .bottom])
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.white)
            }
            .onMapCameraChange { context in
                mapData.cameraPos = .region(context.region)
            }
    }
}

#Preview {
    MapViewExample()
        .environment(MapData())
}
