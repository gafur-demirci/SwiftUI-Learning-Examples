//
//  GeometryReaderViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 10.09.2024.
//

import SwiftUI

struct GeometryReaderViewExample: View {
    var body: some View {
        GeometryReader { geometry in
//            let isPortrait = geometry.size.height > geometry.size.width
//            let message = isPortrait ? "Portrait" : "Landscape"
            
            HStack {
                Image(.book1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 4)
                    .background(Color.gray)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GeometryReaderViewExample()
}
