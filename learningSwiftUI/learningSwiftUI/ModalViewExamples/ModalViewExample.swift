//
//  ModalViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 1.09.2024.
//

import SwiftUI

struct ModalViewExample: View {
    
    @Environment(ApplicationMyData.self) private var appData
//    @State private var showSheet: Bool = false
//    @State private var editItem: Book?
    @State private var presentInspector: Bool = false
    
    var body: some View {
        NavigationStack {
            List(appData.userData) { book in
                BookView(book: book)
//                    .background(.white)
//                    .onTapGesture {
//                        editItem = book
//                    }
            }
            .navigationTitle(Text("Books"))
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .inspector(isPresented: $presentInspector) {
                InspectorViewExample()
                    .inspectorColumnWidth(min: 200, ideal: 250, max: 300)
            }
            .toolbar {
                Spacer()
                Button("Inspector") {
                    presentInspector.toggle()
                }
            }
        }
    }
}

#Preview {
    ModalViewExample()
        .environment(ApplicationMyData.shared)
}
