//
//  AnimationExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 15.12.2024.
//

import SwiftUI

struct AnimationExample: View {
    
    var body: some View {
        TimelineView(.periodic(from: Date(), by: 3)) { time in
            let calendar = Calendar.current
            let components = calendar.dateComponents([.second], from: time.date)
            HStack {
                Text("Time: \(components.second ?? 0)")
                    .font(.largeTitle.bold())
            }
        }
    }
}

#Preview {
    AnimationExample()
}
