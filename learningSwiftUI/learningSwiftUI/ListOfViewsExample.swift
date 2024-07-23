//
//  ListOfViewsExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.07.2024.
//

import SwiftUI

struct ListOfViewsExample: View {
    
    let listCities: [String] = ["Paris","Toronto","Dublin"]
    
    var body: some View {
        VStack {
            ForEach(listCities, id: \.self) { value in
                VStack {
                    Text(value)
                    Divider()
                }
                
            }
            Spacer()
        }
        
    }
}

#Preview {
    ListOfViewsExample()
}
