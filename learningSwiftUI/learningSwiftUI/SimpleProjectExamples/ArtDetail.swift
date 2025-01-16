//
//  ArtDetail.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 16.01.2025.
//

import SwiftUI

struct ArtDetail: View {
    
    @Environment(ArtData.self ) private var artData
    @State var art: Art
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: art.image)
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
            Text(art.name)
                .font(.title.bold())
            Text(art.artist)
                .font(.headline)
                .padding()
            Text(String(art.year))
                .font(.headline)
                .padding()
            Spacer()
            
        }
        .navigationTitle("Art")
    }
}

#Preview {
    ArtDetail(art: ArtData().arts.first!)
        .environment(ArtData())
}
