//
//  LocalizedView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 27.12.2024.
//

import SwiftUI

struct LocalizedView: View {
    var body: some View {
        VStack {
            Text("Hello World!")
                .padding()
            Spacer()
        }
    }
}

#Preview {
    LocalizedView()
}

#Preview {
    LocalizedView()
        .environment(\.locale,  Locale(identifier: "es"))
}
