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
    @State private var showAlert: Bool = false
    var ImagePickerView: ImagePicker!
    
    init() {
        ImagePickerView = ImagePicker(path: $imageData.path, picture: $imageData.picture)
    }
    
    var body: some View {
        NavigationStack(path: $imageData.path) {
            VStack {
                HStack {
                    Button("Share Picture"){
                        showAlert = true
                    }
                    .disabled(imageData.picture == nil ? true : false)
                    Spacer()
                    NavigationLink("Get Picture", value: "Open Picker")
                }
                .navigationDestination(for: String.self, destination: { _ in
                    ImagePickerView
                })
                .alert("Save Picture", isPresented: $showAlert, actions: {
                    Button("Cancel", role: .cancel, action: {
                        showAlert = false
                    })
                    Button("Yes", role: .none, action: {
                        if let picture = imageData.picture {
                            UIImageWriteToSavedPhotosAlbum(picture, nil, nil, nil)
                        }
                    })
                }, message: {
                    Text("Do you want to store the picture in the Photos Library?")
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
