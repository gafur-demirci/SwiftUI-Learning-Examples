//
//  LandMarks.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 11.01.2025.
//

import SwiftUI

struct LandMarks: View {
    @EnvironmentObject private var landMarkData: LandMarkData

    var body: some View {
        List {
            ForEach(landMarkData.landmarks) { landmark in
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.headline)
                        .padding(.bottom, 5)
//                    Image(uiImage: UIImage(data: landmark.picture) ?? UIImage(named: "nocover")!)
//                        .resizable()
//                        .scaledToFit()
                }
            }
        }
    }
}

#Preview {
    LandMarks()
        .environmentObject(LandMarkData())
}
