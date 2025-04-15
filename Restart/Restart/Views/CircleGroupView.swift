//
//  CircleGroupView.swift
//  Restart
//
//  Created by Abdulgafur Demirci on 14.04.2025.
//

import SwiftUI

struct CircleGroupView: View {
    
    // MARK: - PROPERTIES
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
    }
}

#Preview {
    CircleGroupView(ShapeColor: .colorBlue, ShapeOpacity: 0.2)
}
