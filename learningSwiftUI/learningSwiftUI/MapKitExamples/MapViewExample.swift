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
    @State private var routes: [MKRoute]?
    
    var body: some View {
        Map(position: Bindable(mapData).cameraPos) {
            if let routes: [MKRoute] {
                ForEach(routes, id: \.self) { route in
                    MapPolyline(route)
                        .stroke(.red, lineWidth: 5)
                }
                
            }
        }
        .onAppear {
            calculateRoute()
        }
    }
    
    func calculateRoute() {
        let coordOrigin = CLLocationCoordinate2D(latitude: mapData.origin.latitude, longitude: mapData.origin.longitude)
        let placeOrigin = MKPlacemark(coordinate: coordOrigin)
        let origin = MKMapItem(placemark: placeOrigin)
        
        let coordDestination = CLLocationCoordinate2D(latitude: mapData.destination.latitude, longitude: mapData.destination.longitude)
        let placeDestination = MKPlacemark(coordinate: coordDestination)
        let destination = MKMapItem(placemark: placeDestination)
        
        let request = MKDirections.Request()
        request.source = origin
        request.destination = destination
        request.requestsAlternateRoutes = true
        
        Task {
            let directions = MKDirections(request: request)
            let results = try await directions.calculate()
            let routeResults = results.routes
            
            routes = routeResults
        }
    }
}
extension MKRoute: @retroactive Identifiable {
    public var id: UUID {
        return UUID()
    }
}

#Preview {
    MapViewExample()
        .environment(MapData(origin: Coordinate.init(latitude: 40.7637825011971, longitude: -73.9731328627541), destination: Coordinate.init(latitude: 40.7523809365088, longitude: -73.9778321046893)))
}
