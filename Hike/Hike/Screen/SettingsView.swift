//
//  SettingsView.swift
//  Hike
//
//  Created by Abdulgafur Demirci on 8.04.2025.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            
            // MARK: - SECTION: HEADER
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike which looks gorgeous in photos but is even better once you are  actually there. The hike that you hope to do again somaday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } //: HEADER
            .listRowSeparator(Visibility.hidden)
            // MARK: - SECTION: ICONS
            
            // MARK: - SECTION: ABOUT
            Section(content: {
                // 1. Basic Labeled Content
                // LabeledContent("Application", value: "Hike")
                
                // 2. Advanced Labeled Content
                /*
                LabeledContent {
                    Text("Hike")
                        .foregroundStyle(.primary)
                        .fontWeight(.heavy)
                } label: {
                    // Label
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.blue)
                            Image(systemName: "apps.iphone")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                        }
                        Text("Application")
                            .fontWeight(.medium)
                    }
                }
                 */
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Softtech", rowLinkDestination: "https://softtech.com.tr")

            }, header: {
                HStack {
                    Text("ABOUT THE APP")
                }
            }, footer: {
                HStack {
                    Spacer()
                    Text("Copyright © All right reversed.")
                    Spacer()
                }
                .padding(.vertical, 8)
            }) //: SECTION
        } //: LIST
    }
}

#Preview {
    SettingsView()
}
