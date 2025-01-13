//
//  Simpson.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.01.2025.
//

import SwiftUI

struct Simpson: View {
    
    @Environment(SimpsonData.self ) private var simpsonData
    @State var simpson: Simpson
    
    var body: some View {
        VStack {
            Spacer()
            Image(simpson.picture)
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
            Text(simpson.name)
                .font(.title.bold())
            Text(simpson.job)
                .font(.headline)
                .padding()
            Spacer()
            
        }
        .navigationTitle("Simpson")
    }
}

#Preview {
    Simpson(simpson: simpsonData().simpsons.first)
        .environment(SimpsonData())
}
