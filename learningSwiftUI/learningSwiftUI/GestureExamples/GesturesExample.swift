//
//  GesturesExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct GesturesExample: View {
    
    @Environment(GestureData.self) private var gestureData
    @State private var currentPicture: UIImage = UIImage(named: "nocover")!
    
    var body: some View {
        
        VStack {
            HStack {
                ForEach(gestureData.listPictures) { picture in
                    Image(uiImage: UIImage(data: picture.image) ?? UIImage(named: "nocover")!)
                        .resizable()
                        .frame(width: 80, height: 100)
                        .draggable(picture)
                }
            }
            .frame(height: 120)
            Image(uiImage: currentPicture)
                .resizable()
                .scaledToFit()
                .padding(10)
                .dropDestination(for: PictureRepresentation.self, action: { elements, location in
                    if let picture = elements.first {
                        currentPicture = UIImage(data: picture.image) ?? UIImage(named: "nocover")!
                        gestureData.listPictures.removeAll(where: { $0.id == picture.id })
                        return true
                    }
                    return false
                })
        }
        Spacer()
    }
}

#Preview {
    GesturesExample()
        .environment(GestureData())
}
