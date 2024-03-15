//
//  CircleImage.swift
//  Landmarks
//
//  Created by Abdulgafur Demirci on 14.03.2024.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {

        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("IMG_0011"))
}
