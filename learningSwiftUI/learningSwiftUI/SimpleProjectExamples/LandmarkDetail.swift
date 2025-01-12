//
//  LandmarkDetail.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 12.01.2025.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @Environment(LandMarkData.self) private var landmarkData
    @State var selectedLandmark: Landmark
    
    var body: some View {
        VStack {
            Spacer()
            Text(selectedLandmark.name)
                .font(.title.bold())
            Text(selectedLandmark.place ?? "")
                .font(.headline)
                .padding()
            Image(selectedLandmark.picture)
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
            
        }
        .navigationTitle("Landmark")
    }
}

#Preview {
    LandmarkDetail(selectedLandmark: LandMarkData().landmarks[0])
        .environment(LandMarkData())
}
