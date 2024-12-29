//
//  ChartExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 11.12.2024.
//

import SwiftUI
import Charts

@available(iOS 18.0, *)
struct ChartExample: View {
    @Environment(ChartData.self) private var chartData
    
    var body: some View {
        VStack {
            Chart {
//                PointPlot(chartData.listOfItems, x: .value("Food", \.name), y: .value("Calories", \.calories))
                LinePlot(x: "x", y: "y") { x in
                    sin(x)
                }
            }
            .chartXScale(domain: -5...5)
            .chartYScale(domain: -5...5)
            .frame( width: 300, height: 300)
            .padding()
            Spacer()
            /*
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
            */
        }
    }
}
                         
@available(iOS 18.0, *)
#Preview {
    ChartExample()
        .environment(ChartData())
}
