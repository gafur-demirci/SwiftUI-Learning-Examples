//
//  mapView.swift
//  TravelBook
//
//  Created by Abdulgafur Demirci on 19.01.2025.
//

import SwiftUI
import MapKit

struct mapView: View {
    var body: some View {
        Map()
            .padding([.top, .bottom], 10)
    }
}

#Preview {
    mapView()
}
