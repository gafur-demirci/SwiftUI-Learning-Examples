//
//  ControlImageView.swift
//  Pinch
//
//  Created by Abdulgafur Demirci on 20.04.2025.
//

import SwiftUI

struct ControlImageView: View {
    
    var icon: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

#Preview {
    ControlImageView(icon: "minus.magnifyingglass")
}
