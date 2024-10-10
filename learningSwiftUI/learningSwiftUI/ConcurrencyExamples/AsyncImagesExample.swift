//
//  AsyncImagesExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 7.10.2024.
//

import SwiftUI

struct AsyncImagesExample: View {
    
    let website = URL(string: "https://www.formasterminds.com/images/coveruikit4big.png")
    
    var body: some View {
        VStack {
            AsyncImage(url: website, content: { image in
                image
                    .resizable()
                    .scaledToFit()
            }, placeholder: {
                Image("nopicture")
            })
            Spacer()
        }.padding()
        
    }
}

#Preview {
    AsyncImagesExample()
}
