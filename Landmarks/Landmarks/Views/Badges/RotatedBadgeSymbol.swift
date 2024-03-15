//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Abdulgafur Demirci on 15.03.2024.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    
    var angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
