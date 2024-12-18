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
    @State private var selectedPlace: UUID?
    @Namespace private var mapSpace
    
    var body: some View {
        Map(position: Bindable(mapData).cameraPos, selection: $selectedPlace, scope: mapSpace) {
            ForEach(mapData.listLocations) { place in
                Marker(place.name, coordinate: place.location)
            }
        }
        .onMapCameraChange(frequency: .onEnd) { context in
            mapData.cameraPos = .region(context.region)
            Task(priority: .background) {
                await findPlaces()
            }
        }
        .onChange(of: selectedPlace) { old, value in
            if let item = mapData.listLocations.first(where: { $0.id == selectedPlace }) {
                print("Selected \(item.name), Location is: \(item.location)")
            }
        }
        .mapControlVisibility(.hidden)
        .safeAreaInset(edge: .top) {
            HStack {
                MapCompass(scope: mapSpace)
                    .padding(5)
                    .background {
                        Circle()
                            .fill(.thinMaterial)
                            .stroke(.red, lineWidth: 3)
                    }
                Spacer()
                MapPitchToggle(scope: mapSpace)
                    .padding(5)
                    .background {
                        Circle()
                            .fill(.thinMaterial)
                            .stroke(.red, lineWidth: 3)
                    }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .mapScope(mapSpace)
    }
    
    func findPlaces() async {
        if let region = mapData.cameraPos.region {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = "Pizza"
            request.region = region
            
            let search = MKLocalSearch(request: request)
            if let results = try? await search.start() {
                
                let items = results.mapItems
                
                await MainActor.run {
                    mapData.listLocations = []
                    for item in items {
                        if let location = item.placemark.location?.coordinate {
                            let place = PlaceMarker(id: UUID(), name: item.name!, location: location)
                            mapData.listLocations.append(place)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MapViewExample()
        .environment(MapData())
}
