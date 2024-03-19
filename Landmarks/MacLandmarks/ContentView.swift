//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Abdulgafur Demirci on 19.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
