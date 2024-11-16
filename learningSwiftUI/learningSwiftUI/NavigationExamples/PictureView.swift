//
//  PictureView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 18.08.2024.
//

import SwiftUI

struct PictureView: View {
    
    @Environment(ApplicationMyData.self) private var appData
    
    var body: some View {
        VStack {
            Image(appData.selectedBook?.cover ?? "nopicture")
                .resizable()
                .scaledToFit()
        }
        .navigationTitle(Text("Cover"))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading, content: {
                Button("Go Back") {
                    appData.viewPath.removeLast()
                }
            })
            ToolbarItem(placement: .topBarTrailing, content: {
                Button("Back to List") {
                    appData.viewPath = NavigationPath()
                }
            })
        }
    }
}

#Preview {
    NavigationStack {
        PictureView()
            .environment(ApplicationMyData())
    }
    
}
