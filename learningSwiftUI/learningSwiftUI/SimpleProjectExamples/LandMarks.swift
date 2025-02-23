//
//  LandMarks.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 11.01.2025.
//

import SwiftUI

struct LandMarks: View {
    @Environment(LandMarkData.self) private var landMarkData: LandMarkData
    
    @State private var selectedLandmark = Set<Landmark.ID>()
    
    var body: some View {
//        Table(of: Landmark.self, columns: {
//            TableColumn("Name", value: \.name)
//        }, rows: {
//            ForEach(landMarkData.landmarks) { landmark in
//                TableRow(landmark)
//            }
//        })
        NavigationView {
            Table(landMarkData.landmarks, selection: $selectedLandmark) {
                TableColumn("Name") { landmark in
                    NavigationLink(destination: LandmarkDetail(selectedLandmark: landmark)) {
                        Text(landmark.name)
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding(.bottom, 5)
                    }
                }
            }
        }

        .navigationTitle("Landmarks")
//        .navigationDestination(for: Landmark.self, destination: { landmark in
//            LandmarkDetail(selectedLandmark: landmark)
//        })
//        Text("\(selectedLandmark)")
//        Button("Mark") {
//            print(selectedLandmark)
//        }
//        List {
//            ForEach(landMarkData.landmarks) { landmark in
//                VStack(alignment: .leading) {
//                    Text(landmark.name)
//                        .font(.headline)
//                        .padding(.bottom, 5)
//                }
//            }
//        }
    }
    
//    func tableRowSelection(_ selection: Set<Landmark.ID>) {
//        selectedLandmark = selection
//    }
}

#Preview {
    LandMarks()
        .environment(LandMarkData())
}
