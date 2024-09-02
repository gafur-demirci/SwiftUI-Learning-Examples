//
//  SettingsView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 18.08.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(ApplicationData.self) private var appData
//    @Binding var viewPath: NavigationPath
//    @State private var showPictures: Bool = true
//    @State private var showYear: Bool = true
    
    var body: some View {
        Form {
            Section(header: Text("Settings"), footer: Text("Select what you want to see")) {
                Toggle("Show Pictures", isOn: Bindable(appData).showPicture)
                Toggle("Show Year", isOn: Bindable(appData).showYear)
            }
        }
//        .navigationTitle("Settings")
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
            .environment(ApplicationData())
//        SettingsView(viewPath: .constant(NavigationPath()))
    }
}
