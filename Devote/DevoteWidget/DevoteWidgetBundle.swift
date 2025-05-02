//
//  DevoteWidgetBundle.swift
//  DevoteWidget
//
//  Created by Abdulgafur Demirci on 2.05.2025.
//

import WidgetKit
import SwiftUI

@main
struct DevoteWidgetBundle: WidgetBundle {
    var body: some Widget {
        DevoteWidget()
        DevoteWidgetControl()
        DevoteWidgetLiveActivity()
    }
}
