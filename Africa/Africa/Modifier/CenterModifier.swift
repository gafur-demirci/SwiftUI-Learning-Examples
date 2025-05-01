//
//  CenterModifier.swift
//  Africa
//
//  Created by Abdulgafur Demirci on 25.04.2025.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
