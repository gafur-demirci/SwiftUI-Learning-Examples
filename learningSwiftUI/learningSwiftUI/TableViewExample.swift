//
//  TableViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 8.08.2024.
//

import SwiftUI

struct TableViewExample: View {
    
    @Environment(ApplicationData.self) private var appData
    
    var body: some View {
        Table(of: ConsumableItem.self, columns: {
            TableColumn("Name", value: \.name)
            TableColumn("Category", value: \.category)
            TableColumn("Calories") { item in
                Text("\(item.calories)")
            }
            .width(100)
        }, rows: {
            TableRow(ConsumableItem(name: "STANDARD", category: "", calories: 0, included: false))
            ForEach(appData.listOfItems)
        })
    }
}

#Preview {
    TableViewExample()
        .environment(ApplicationData())
}
