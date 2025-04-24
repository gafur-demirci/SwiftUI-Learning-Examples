//
//  SettingsRowView.swift
//  Fruits
//
//  Created by Abdulgafur Demirci on 22.04.2025.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - PROPERTIES
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil

    // MARK: - BODY

    var body: some View {
      VStack {
        Divider().padding(.vertical, 4)
        
        HStack {
          Text(name).foregroundColor(Color.gray)
          Spacer()
          if (content != nil) {
            Text(content!)
          } else if (linkLabel != nil && linkDestination != nil) {
            Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
            Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
          }
          else {
            EmptyView()
          }
        }
      }
    }
}

#Preview {
    Group {
      SettingsRowView(name: "Developer", content: "John / Jane")
        .padding()
      SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
        .preferredColorScheme(.dark)
        .padding()
    }
}
