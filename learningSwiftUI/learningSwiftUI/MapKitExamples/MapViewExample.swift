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
    @State private var openView: Bool = false
    @State private var lookScene: MKLookAroundScene?
    
    var body: some View {
        Map(position: Bindable(mapData).cameraPos)
            .safeAreaInset(edge: .bottom) {
                if openView {
                    VStack {
                        LookAroundPreview(initialScene: lookScene)
                            .frame(height: 200)
                        Button("Hide Street") {
                            openView = false
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    Button("Show Street") {
                        if let region = mapData.cameraPos.region {
                            Task {
                                let request = MKLookAroundSceneRequest(coordinate: region.center)
                                if let scene = try? await request.scene {
                                    lookScene = scene
                                    openView = true
                                }
                            }
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
    }
}

#Preview {
    MapViewExample()
        .environment(MapData())
}
