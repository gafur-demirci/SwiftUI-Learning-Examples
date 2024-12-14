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
                        LineMark(x: .value("Date", sale.date, unit: .day), y: .value("Sales", sale.amount))
                    }
                    .foregroundStyle(by: .value("Product", product.name))
                }
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
