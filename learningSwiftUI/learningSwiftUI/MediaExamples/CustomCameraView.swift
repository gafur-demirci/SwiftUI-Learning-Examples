//
//  CustomCameraView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 24.12.2024.
//

import SwiftUI

#if os(iOS)
struct CustomCameraView: View {
    
    @Environment(CustomCameraData.self) private var cameraData
    
    var body: some View {
        ZStack {
            cameraData.cameraView
            Spacer()
            HStack {
                Button("Cancel") {
                    cameraData.path = NavigationPath()
                }
                Spacer()
                Button("Take Picture") {
                    cameraData.takePicture()
                }
            }
            .padding()
            .frame(height: 80)
            .background(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.8))
        }
        .edgesIgnoringSafeArea(.all)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .navigationBarHidden(true)
        .task {
            await cameraData.getAuthorization()
        }
        .onDisappear {
            cameraData.viewData.previewObservation = nil
        }
    }
}

#Preview {
    CustomCameraView()
        .environment(CustomCameraData())
}
#endif
