//
//  ImageRendererExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 14.12.2024.
//

import SwiftUI
#if os(iOS)
struct ImageRendererExample: View {
    
    @State private var pattern: UIImage?
    let newPicture: NewPictureView = NewPictureView()
    
    var body: some View {
        VStack {
            newPicture
            Button("Export Image") {
                let renderer = ImageRenderer(content: newPicture)
                if let img = renderer.uiImage {
                    pattern = img.preparingThumbnail(of: CGSize(width: 55.5, height: 83))
                }
            }
            if let pattern {
                Rectangle()
                    .fill(.image(Image(uiImage: pattern)))
                    .frame(width: 222, height: 332)
            }
            Spacer()
        }
    }
}

struct NewPictureView: View {
    var body: some View {
        Image("book10")
            .resizable()
            .scaledToFit()
            .frame(width: 111, height: 166)
            .clipShape(Circle())
    }
}

#Preview {
    ImageRendererExample()
}
#endif
