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
            .chartOverlay(content: { proxy in
                GeometryReader { geometry in
                    if let plotFrame = proxy.plotContainerFrame {
                        let frame = geometry[plotFrame]
                        VStack {
                            Text("My Chart")
                                .padding(30)
                        }
                        .background(.ultraThinMaterial, in: Capsule())
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
            })
            Spacer()
        }
    }
}

#Preview {
    ChartExample()
        .environment(ChartData())
}
