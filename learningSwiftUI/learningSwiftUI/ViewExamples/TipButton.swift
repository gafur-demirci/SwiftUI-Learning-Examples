//
//  TipButton.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 29.12.2024.
//

import SwiftUI
import TipKit

struct TipButton: Tip {
    var title: Text {
        Text("Press to Save")
    }
    var message: Text? {
        Text("Press this button to save your changes")
    }
}
