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
                SectorMark(angle: .value("Value", item.calories))
                    .foregroundStyle(by: .value("Product Category", item.name))
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
