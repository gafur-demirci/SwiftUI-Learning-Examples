//
//  TheSimpsons.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.01.2025.
//

import SwiftUI

struct TheSimpsons: View {
    
    @Environment(SimpsonData.self) private var simpsonData: SimpsonData
    @State private var selectedSimpson = Set<Simpson.ID>()
    
    var body: some View {
        NavigationView {
            Table(simpsonData.simpsons, selection: $selectedSimpson) {
                TableColumn("Name") { simpson in
                    NavigationLink(destination: TheSimpson(simpson: simpson)) {
                        Text(simpson.name)
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding(.bottom, 5)
                    }
                }
            }
        }
        .navigationTitle("Simpsons")
    }
}

#Preview {
    TheSimpsons()
        .environment(SimpsonData())
}
