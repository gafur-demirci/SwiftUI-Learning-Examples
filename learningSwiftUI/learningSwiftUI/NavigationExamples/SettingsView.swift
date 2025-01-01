//
//  SettingsView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 18.08.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(ApplicationMyData.self) private var appData
    
    var body: some View {
        Form {
            Section(header: Text("Settings"), footer: Text("Select what you want to see")) {
                Toggle("Show Pictures", isOn: Bindable(appData).showPicture)
                Toggle("Show Year", isOn: Bindable(appData).showYear)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
            .environment(ApplicationMyData.shared)
//        SettingsView(viewPath: .constant(NavigationPath()))
    }
}
