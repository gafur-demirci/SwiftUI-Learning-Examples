//
//  MediaViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.12.2024.
//

import SwiftUI

class ImageData: NSObject, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var picture: UIImage?
}

struct MediaViewExample: View {
    
    @ObservedObject var imageData: ImageData = ImageData()
    var ImagePickerView: ImagePicker!
    
    init() {
        ImagePickerView = ImagePicker(path: $imageData.path, picture: $imageData.picture)
    }
    
    var body: some View {
        NavigationStack(path: $imageData.path) {
            VStack {
                HStack {
                    if let picture = imageData.picture {
                        let photo = Image(uiImage: picture)
                        ShareLink("Share Picture", item: photo, preview: SharePreview("Photo", image: photo))
                    }
                    Spacer()
                    NavigationLink("Get Picture", value: "Open Picker")
                }
                .navigationDestination(for: String.self, destination: { _ in
                    ImagePickerView
                })
                Image(uiImage: imageData.picture ?? UIImage(named: "nocover")!)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .clipped()
                Spacer()
            }
            .padding()
        }
        .statusBarHidden()
    }
}

#Preview {
    MediaViewExample()
}
