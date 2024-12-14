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
                ForEach(chartData.listOfItems) { item in
                    BarMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                        .foregroundStyle(.cyan)
                        .opacity(0.5)
                        .cornerRadius(20)
                }
                RuleMark(y: .value("Average", averageCalories()))
                    .foregroundStyle(.black)
                    .lineStyle(StrokeStyle(lineWidth: 5))
                    .annotation(position: .top, alignment: .leading) {
                        Text("Average Calories")
                    }
            }
            .frame(height: 300)
            .padding()
            Spacer()
        }
    }
    func averageCalories() -> Int {
        let total = chartData.listOfItems.reduce(0, { $0 + $1.calories })
        return total / chartData.listOfItems.count
    }
}
                         
                         
#Preview {
    ChartExample()
        .environment(ChartData())
}
