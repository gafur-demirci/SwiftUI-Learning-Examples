//
//  UserDefaultsExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//

import SwiftUI

struct UserDefaultsExample: View {
    
    @AppStorage("counter") var myCounter: Double = 0
    
    var body: some View {
        HStack {
            Stepper("", value: $myCounter)
                .labelsHidden()
            Text("\(myCounter.formatted(.number.precision(.fractionLength(0))))")
                .font(.title)
        }
    }
}

#Preview {
    UserDefaultsExample()
}
