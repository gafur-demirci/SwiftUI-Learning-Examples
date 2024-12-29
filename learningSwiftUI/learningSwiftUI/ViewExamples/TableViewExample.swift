//
//  TableViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 8.08.2024.
//

import SwiftUI

struct TableViewExample: View {
    
    @Environment(ApplicationMyData.self) private var appData
//    @State private var selectedItems: Set<ConsumableItem.ID> = []
    @State private var sort = [KeyPathComparator(\ConsumableItem.name)]
//    @State private var sort = [KeyPathComparator(\ConsumableItem.name),KeyPathComparator(\ConsumableItem.calories)]
    
//    var sortedItems: [ConsumableItem] {
//        let list = appData.listOfItems.sorted(using: sort)
//        return list
//    }
    
    var body: some View {
//        VStack {
//            EditButton()
        Table(of: Employees.self, columns: {
            TableColumn("Name", value: \.name)
            TableColumn("Position", value: \.position)
        }, rows: {
            ForEach(appData.listOfEmployees) { employee in
                if employee.subordinates.isEmpty {
                    TableRow(employee)
                }else {
                    DisclosureTableRow(employee) {
                        ForEach(employee.subordinates)
                    }
                }
            }
        })
        /*
             TableColumn("Included", value: \.included, comparator: BoolComparator()) { item in
             Toggle("", isOn: itemBinding(id: item.id).included)
             .labelsHidden()
             }
             .width(100)
             */
        /*
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
         */
//            Text(listSelected())
//                .padding()
//        }
        
    }
    /*
    struct BoolComparator: SortComparator {
      var order: SortOrder = .forward
      func compare(_ lhs: Bool, _ rhs: Bool) -> ComparisonResult {
          switch (lhs, rhs) {
            case (true, false):
              return order == .forward ? .orderedDescending : .orderedAscending
            case (false, true):
              return order == .forward ? .orderedAscending : .orderedDescending
            default: return .orderedSame
            }
      }
    }
    func itemBinding(id: UUID) -> Binding<ConsumableItem> {
        let index = appData.listOfItems.firstIndex(where: { $0.id == id}) ?? 0
        return Bindable(appData).listOfItems[index]
    }
    */
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
        .environment(ApplicationMyData.shared)
}
