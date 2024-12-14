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
            Chart {
                ForEach(chartData.sales) { product in
                    ForEach(product.sales) { sale in
                        BarMark(x: .value("Name", sale.date, unit: .day), y: .value("Sales", sale.amount))
                    }
                    .foregroundStyle(by: .value("Products", product.name))
                    .position(by: .value("Products", product.name))
                }
            }
            .chartLegend(.hidden)
            .chartScrollableAxes(.horizontal)            // scroll screen for horizontal axis
            .chartXVisibleDomain(length: 3600 * 24 * 4)  // 4 days show on the screen
            .chartForegroundStyleScale([
                "Bagels": .red,
                "Brownies": .orange,
            ])
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
