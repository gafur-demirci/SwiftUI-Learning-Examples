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
        
        /*
        GeometryReader { geometry in
//            let isPortrait = geometry.size.height > geometry.size.width
//            let message = isPortrait ? "Portrait" : "Landscape"
            let globalX = Int(geometry.frame(in: .global).origin.x)
            let globalY = Int(geometry.frame(in: .global).origin.y)
            Text("Position: \(globalX) / \(globalY)")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            /*
            HStack {
                Image(.book1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 4)
                    .background(Color.gray)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
             */
        }
        .frame(width: 200, height: 250)
        .background(Color.gray)
//        .ignoresSafeArea()
        */
    }
}

#Preview {
    GeometryReaderViewExample()
}
