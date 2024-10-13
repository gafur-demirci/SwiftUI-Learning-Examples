//
//  UserSettingsView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//

import SwiftUI

struct UserSettingsView: View {
    
    @AppStorage("cornerSize") var cornerSize: Double = 0
    @AppStorage("showYear") var showYear: Bool = true
    @AppStorage("showCover") var showCover: Bool = true
    
    var body: some View {
        Form {
            Section {
                HStack(alignment: .top) {
                    Text("Corner Radius")
                        .padding(6)
                    VStack {
                        Slider(value: $cornerSize, in: 0...30)
                        Image(.nocover)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(cornerSize)
                            .frame(width: 80, height: 100)
                    }
                }
            }
            Section {
                List {
                    Toggle("Show Year", isOn: $showYear)
                    Toggle("Show Cover", isOn: $showCover)
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    UserSettingsView()
}
