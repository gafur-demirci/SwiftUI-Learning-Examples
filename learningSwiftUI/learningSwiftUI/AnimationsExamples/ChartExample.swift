//
//  ChartExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 11.12.2024.
//

import SwiftUI
import Charts

struct ChartExample: View {
    @Environment(ChartData.self) private var chartData
    
    var body: some View {
        VStack {
            Chart(chartData.listOfItems) { item in
                BarMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
            }
            .frame(height: 300)
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ChartExample()
        .environment(ChartData())
}
