//
//  MediaViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.12.2024.
//

import SwiftUI

struct MediaViewExample: View {
    
    @State private var path = NavigationPath()
    @State private var picture: UIImage?

    var body: some View {
       NavigationStack(path: $path) {
          VStack {
             HStack {
                Spacer()
                NavigationLink("Get Picture", value: "Open Picker")
             }.navigationDestination(for: String.self, destination: { _ in
                ImagePicker(path: $path, picture: $picture)
             })
             Image(uiImage: picture ?? UIImage(named: "nocover")!)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .clipped()
             Spacer()
          }.padding()
       }.statusBarHidden()
    }
}

#Preview {
    MediaViewExample()
}
