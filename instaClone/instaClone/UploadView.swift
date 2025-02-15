//
//  UploadView.swift
//  instaClone
//
//  Created by Abdulgafur Demirci on 9.02.2025.
//

import SwiftUI

struct UploadView: View {
    
    @State var comments: String = ""
    @State var image: UIImage?
    @State var isPresented: Bool = false
    
    var body: some View {
        Text("Upload")
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        isPresented = true
                    }
            } else {
                Image("nocover")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        isPresented = true
                    }
            }
            TextField("Comment", text: $comments)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button("Upload") {
                print(comments)
                print(image!)
            }
            .disabled(comments.isEmpty || image == nil)
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            NavigationLink(
                destination: FeedsView(),
                label: { EmptyView() }
            )
        )
        .sheet(isPresented: $isPresented) {
            ImagePicker(picture: $image)
        }
    }
}

#Preview {
    UploadView()
}
