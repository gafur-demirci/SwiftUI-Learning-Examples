//
//  SourceLinkView.swift
//  Fruits
//
//  Created by Abdulgafur Demirci on 22.04.2025.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
      GroupBox() {
        HStack {
          Text("Content source")
          Spacer()
          Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
          Image(systemName: "arrow.up.right.square")
        }
        .font(.footnote)
      }
    }
}

#Preview {
    SourceLinkView()
}
