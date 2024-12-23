//
//  MediaViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.12.2024.
//

import SwiftUI
import PhotosUI

struct MediaViewExample: View {
    
    @State private var selected: PhotosPickerItem?
    @State private var picture: UIImage?
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(uiImage: picture ?? UIImage(named: "nocover")!)
                    .resizable()
                    .scaledToFill()
                Spacer()
                PhotosPicker(selection: $selected, matching: .images, photoLibrary: .shared()) {
                    Text("Select a photo")
                }
                .padding()
                .buttonStyle(.borderedProminent)
            }
            .onChange(of: selected, initial: false) { old, item in
                Task(priority: .background) {
                    if let data = try? await item?.loadTransferable(type: Data.self) {
                        picture = UIImage(data: data)
                    }
                }
            }
        }
    }
}

#Preview {
    MediaViewExample()
}
