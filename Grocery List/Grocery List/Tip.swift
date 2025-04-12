//
//  Tip.swift
//  Grocery List
//
//  Created by Abdulgafur Demirci on 11.04.2025.
//

import Foundation
import TipKit

struct ButtonTip: Tip {
    var title: Text = Text("Essential Foods")
    var message: Text? = Text("Add some overday items to the shopping list.")
    var image: Image? = Image(systemName: "info.circle")
}
