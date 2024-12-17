//
//  MapViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 16.12.2024.
//

import SwiftUI
import MapKit

struct MapViewExample: View {
    var body: some View {
        Map()
            .ignoresSafeArea()
    }
}

#Preview {
    MapViewExample()
}
