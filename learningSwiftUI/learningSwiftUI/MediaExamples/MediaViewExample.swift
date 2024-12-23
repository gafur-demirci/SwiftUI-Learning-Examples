//
//  MediaViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.12.2024.
//

import SwiftUI
import PhotosUI

struct MediaViewExample: View {
    
    @Environment(MediaData.self) private var mediaData
    
    let guides = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: guides) {
                    ForEach(mediaData.listPictures) { image in
                        Image(uiImage: image.image)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            .padding()
            Spacer()
            PhotosPicker(selection: Bindable(mediaData).selected, maxSelectionCount: 4, selectionBehavior: .continuous, matching: .images, photoLibrary: .shared(), label: {
                Text("Select Photos")
            })
            .photosPickerStyle(.inline)
            .photosPickerDisabledCapabilities(.selectionActions)
        }
        .onChange(of: mediaData.selected, initial: false) { old, items in
                mediaData.removeDeselectedItems()
                mediaData.addSelectedItems()
        }
    }
}

#Preview {
    MediaViewExample()
        .environment(MediaData())
}
