//
//  CustomContainersView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 28.12.2024.
//

import SwiftUI

struct CustomContainersView: View {
    var body: some View {
        BoxListView {
            Text("First Item")
            Text("Second Item")
            Text("Third Item")
        }
    }
}

#Preview {
    CustomContainersView()
}
