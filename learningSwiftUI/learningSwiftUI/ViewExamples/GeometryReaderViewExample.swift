//
//  GeometryReaderViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 10.09.2024.
//

import SwiftUI

struct BoxPreference: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: CGSize  = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct GeometryReaderViewExample: View {
    
    @State private var size: CGSize = .zero
    
    var body: some View {
        VStack {
            Image(.book2)
                .resizable()
                .scaledToFit()
                .background(
                    // GeometryReader view info by size default to inside view, if you want send to
                    // this info to upside view, you use to preferenceKey decleration
                    GeometryReader { geometry in
                        Color.clear
                            .preference(key: BoxPreference.self, value: geometry.size)
                        /*
                            .onAppear {
                                size = geometry.size
                            }
                         */
                    })
            Text("\(Int(size.width)) x \(Int(size.height))")
        }
        .padding(100)
        .onPreferenceChange(BoxPreference.self ,perform: { value in
            size = value
        })
    }
}

#Preview {
    GeometryReaderViewExample()
}
