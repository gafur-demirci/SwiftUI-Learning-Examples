//
//  SettingsView.swift
//  Todo
//
//  Created by Abdulgafur Demirci on 4.05.2025.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var iconSettings: IconNames
    
    // MARK: - THEME
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    @State private var isThemeChanged: Bool = false
    
    // MARK: - APP ICON
    @State var selectedIconName: String
    let currentIcon = UIApplication.shared.alternateIconName ?? "Blue"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                // MARK: - FORM
                Form(content: {
                    
                    // MARK: - SECTION 1
                    
                    Section(header: Text("Choose the app icon")) {
                        NavigationLink(destination: SettingsIconsView(selectedIconName: $selectedIconName)) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .strokeBorder(Color.primary, lineWidth: 2)
                                    
                                    Image(systemName: "paintbrush")
                                        .font(.system(size: 28, weight: .regular, design: .default))
                                        .foregroundColor(Color.primary)
                                } //: ZSTACK
                                .frame(width: 44, height: 44)
                                
                                Text("App Icons".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.primary)
                                
                                Spacer()
                                
                                HStack {
                                    Image(uiImage: UIImage(named: selectedIconName)!)
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 44, height: 44)
                                        .cornerRadius(8)
                                    
                                    Text(selectedIconName)
                                        .frame(alignment: .leading)
                                } //: HSTACK
                                .padding(3)
                            } //: HSTACK
                        } //: NAVIGATION
                    } //: SECTION 1
                      .padding(.vertical, 3)
                    
                    // MARK: - SECTION 2
                    
                    Section(header:
                        HStack {
                            Text("Choose the app theme")
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(Color(themes[self.theme.themeSettings].themeColor))
                        }
                    ) {
                        List {
                            ForEach(themes, id: \.id) { item in
                                Button(action: {
                                    self.theme.themeSettings = item.id
                                    UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme")
                                    self.isThemeChanged.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundStyle(Color(item.themeColor))
                                        
                                        Text(item.themeName)
                                    }
                                } //: BUTTON
                                .tint(.primary)
                            } //: LOOP
                        } //: LIST
                    } //: SECTION 2
                    .padding(.vertical, 3)
                    .alert(isPresented: $isThemeChanged) {
                        Alert(
                            title: Text("SUCCESS!"),
                            message: Text("The app theme has been changed to the \(themes[self.theme.themeSettings].themeName). Now close and restart the app to see the changes successfully."),
                            dismissButton: .default(Text("OK")))
                    }
                    
                    // MARK: - SECTION 3
                    
                    Section(header: Text("Follow us on social media")) {
                        FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://www.softtech.com.tr")
                        FormRowLinkView(icon: "link", color: .blue, text: "Twitter", link: "https://twitter.com/68_gafur")
                        FormRowLinkView(icon: "play.rectangle", color: .green, text: "Courses", link: "https://softtech.udemy.com")
                    } //: SECTION 3
                    .padding(.vertical, 3)
                     
                    
                    // MARK: - SECTION 4
                    
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstTitle: "Application", secondTitle: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstTitle: "Compatibliity", secondTitle: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstTitle: "Developer", secondTitle: "Abdulgafur Demirci")
                        FormRowStaticView(icon: "paintbrush", firstTitle: "Designer", secondTitle: "John Doe")
                        FormRowStaticView(icon: "flag", firstTitle: "Version", secondTitle: "1.0.0")
                    } //: SECTION 4
                    .padding(.vertical, 3)
                    
                }) //: FORM
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - FOOTER
                
                Text("Copyright © 2025 Abdulgafur Demirci.\nBetter Apps ♡ Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundStyle(.secondary)
            } //: VSTACK
            .toolbar(content: {
                ToolbarItem(content: {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                })
            })
            .navigationTitle(Text("Settings"))
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.colorBackground.edgesIgnoringSafeArea(.all))
        } //: NAVIGATION
        .tint(Color(themes[self.theme.themeSettings].themeColor))
        .navigationViewStyle(StackNavigationViewStyle())
        
        .onAppear {
            let currentIcon = UIApplication.shared.alternateIconName ?? "Blue"
            selectedIconName = currentIcon
        }
    }
}

#Preview {
    SettingsView(selectedIconName: "Blue")
        .environmentObject(IconNames())
}
