//
//  SettingsIconsView.swift
//  Todo
//
//  Created by Abdulgafur Demirci on 5.05.2025.
//

import SwiftUI

struct SettingsIconsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    
    let iconNames = ["Blue", "BlueDark", "BlueLight", "Green", "GreenDark", "GreenLight", "Pink", "PinkDark", "PinkLight"]
    @Binding var selectedIconName: String
    
    var body: some View {
        List {
            ForEach(iconNames, id: \.self) { name in
                    Button(action: {
                        self.selectedIconName = name
                        self.setAppIcon(icon: name)
                    }, label: {
                        HStack {
                            Image(uiImage: UIImage(named: name)!)
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                                .cornerRadius(8)
                            Spacer()
                            
                            Text(name)
                                .frame(alignment: .leading)
                        }
                    })
                .padding(3)
            }
        }
//        .listStyle(.grouped)
        .listRowSeparator(.visible)
    }
    
    // MARK: - FUNCTIONS
    private func setAppIcon(icon: String) {
        UIApplication.shared.setAlternateIconName(icon) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Success! You have changed the app icon.")
                self.presentationMode.wrappedValue.dismiss()
            }
        }

    }
}

#Preview {
    @Previewable @State var previewSelectedIconName = "Blue"
    SettingsIconsView(selectedIconName: $previewSelectedIconName)
}
