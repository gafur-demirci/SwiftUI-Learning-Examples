//
//  SettingsView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 18.08.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
//    @Binding var viewPath: NavigationPath
    @State private var showPictures: Bool = true
    @State private var showYear: Bool = true
    
    var body: some View {
        Form {
            Toggle("Show Pictures", isOn: $showPictures)
            Toggle("Show Year", isOn: $showYear)
        }
        .navigationTitle("Settings")
        .navigationBarBackButtonHidden(true)
//        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                Button("Go Back") {
////                    dismiss()
//                    viewPath.removeLast()
//                }
//            }
//        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
//        SettingsView(viewPath: .constant(NavigationPath()))
    }
}