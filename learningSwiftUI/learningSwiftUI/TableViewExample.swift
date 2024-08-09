//
//  TableViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 8.08.2024.
//

import SwiftUI

struct TableViewExample: View {
    
    @Environment(ApplicationData.self) private var appData
    @State private var selectedItems: Set<ConsumableItem.ID> = []
//    @State private var sort = [KeyPathComparator(\ConsumableItem.name),KeyPathComparator(\ConsumableItem.calories)]
    
//    var sortedItems: [ConsumableItem] {
//        let list = appData.listOfItems.sorted(using: sort)
//        return list
//    }
    
    var body: some View {
//        VStack {
//            EditButton()
            Table(appData.listOfItems, selection: $selectedItems) {
                TableColumn("Name", value: \.name)
                TableColumn("Category", value: \.category)
                TableColumn("Calories") { item in
                    Text("\(item.calories)")
                }
                .width(100)
            }
            .contextMenu(forSelectionType: ConsumableItem.ID.self, menu: { selected in
                if(selected.count <= 0) {
                    Button("Create New Item") {
                        let newItem = ConsumableItem(name: "Test", category: "Test", calories: 0, included:false)
                        appData.listOfItems.append(newItem)
                    }
                }else if (selected.count == 1 ){
                    Button("Remove Item") {
                        appData.listOfItems.removeAll(where: { item in
                                                      item.id == selected.first})
                    }
                } else {
                    Button("Remove Selected Items") {
                        appData.listOfItems.removeAll(where: { item in
                            selected.contains(item.id)})
                    }
                }
            })
//            Text(listSelected())
//                .padding()
//        }
        
    }
    /*
    func listSelected() -> String {
        let list: [String] = selectedItems.map({ id in
            let item = appData.listOfItems.first(where: { $0.id == id })
            return item?.name ?? ""})
        return String(list.sorted().joined(separator: " "))
    }
     */
}

#Preview {
    TableViewExample()
        .environment(ApplicationData())
}
