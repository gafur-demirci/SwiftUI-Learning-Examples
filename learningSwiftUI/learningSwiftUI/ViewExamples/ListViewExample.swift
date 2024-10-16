//
//  ListViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 4.08.2024.
//

import SwiftUI

struct ListViewExample: View {
    
    @Environment(ApplicationMyData.self) private var appData
    let colors = [.white, Color(white: 0.95)]
    
    var orderList: [(key: String, value: [Book])] {
        let listGroup: [String: [Book]] = Dictionary(grouping: appData.userData, by: { value in
            let index = value.title.startIndex
            let initial = value.title[index]
            return String(initial)
        })
        return listGroup.sorted(by: { $0.key < $1.key })
    }
    
    @State private var selectedRows: Set<Book.ID> = []
    @State private var editActive: Bool = false
    
    var body: some View {
        List {
            ForEach(appData.items) { section in
                Section(header: Text(section.name)) {
                    OutlineGroup(section.options ?? [], children: \.options) { item in
                        Text(item.name)
                    }
                }
                
            }
        }
        
//        List(appData.items, children: \.options, rowContent: { item in
//            Text(item.name)
//        })
        //            ForEach(Bindable(appData).userData) { $book in
        //                CellBook(book: book)
        //                    .swipeActions {
        //                        Button(role: .destructive, action: {
        //                            removeBook(book: book)
        //                        }, label: {
        //                            Image(systemName: "trash")
        //                        })
        //
        //                    }
        //                    .background(.white)
        //                    .onTapGesture {
        //                        book.selected.toggle()
        //                    }
    //        .listStyle(.plain)
    //        .refreshable {
    //            print("Loading values")
    //        }
    
    
    //        VStack {
    //            HStack {
    //                Button(editActive ? "Done": "Edit") {
    //                    editActive.toggle()
    //                }
    ////                EditButton()
    //                Spacer()
    //                Button (action: {
    //                    removeSelected()
    //                }, label: {
    //                    Image(systemName: "trash")
    //                })
    //                .disabled(selectedRows.count == 0 ? true : false)
    //
    //            }
    //            .padding()
    //
    //            List(selection: $selectedRows, content: {
    //                ForEach(appData.userData) { book in
    //                    CellBook(book: book)
    //                }
    //            })
    //            .listStyle(.plain)
    //            .environment(\.editMode, .constant(editActive ?  EditMode.active : EditMode.inactive))
    //        }
}

//    func removeBook(book: Book) {
//        var indexes = IndexSet()
//        if let index = appData.userData.firstIndex(where: {$0.id == book.id }) {
//            indexes.insert(index)
//        }
//        appData.userData.remove(atOffsets: indexes)
//    }

//    func removeSelected() {
//        var indexes = IndexSet()
//        for item in selectedRows {
//            if let index = appData.userData.firstIndex(where: { $0.id == item }) {
//                indexes.insert(index)
//            }
//        }
//        appData.userData.remove(atOffsets: indexes)
//        selectedRows = []
//        editActive = false
//    }


//        List{
//            ForEach(orderList, id: \.key) { sections in
//                Section(header: Text(sections.key)) {
//                    ForEach(sections.value) { book in
//                        CellBook(book: book)
//                    }
//                }
//                .headerProminence(.increased)
//            }
//        }
//            Section(header: Text("Statistics")) {
//                HStack {
//                    Text("Total Books")
//                    Spacer()
//                    Text(String(appData.userData.count))
//                }
//            }
//            .listSectionSeparator(.hidden, edges: .top)
//            .listSectionSeparatorTint(.blue)
//            .headerProminence(.increased)
//            Section(header: Text("My Books")) {
//                ForEach(appData.userData) { book in
//                    CellBook(book: book)
//                }
//                .headerProminence(.increased)
//            }
//            .listSectionSeparator(.hidden)
//        }
//        .environment(\.defaultMinListRowHeight, 100)
//        .listStyle(.plain)
//        List(appData.userData) { book in
//            let index = appData.userData.firstIndex(where: { $0.id == book.id}) ?? 0
//
//            CellBook(book: book)
//                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
//                .listRowBackground(index % 2 == 0 ? colors[0] : colors[1])
//                .listRowSeparator(.hidden)
//        }
//        .listStyle(.plain)
}


struct CellBook: View {
    
    @Environment(ApplicationMyData.self) private var appData
    let book: Book
    
    var body: some View {
        HStack(alignment: .top) {
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 100)
            VStack(alignment: .leading, spacing: 2) {
                Text(book.title)
                    .bold()
                Text(book.author)
                Text(book.displayYear)
                    .font(.caption)
                Spacer()
            }
            .padding(.top, 5)
            Spacer()
            
            Button(action: {
                removeBook(book: book)
            }, label: {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .frame(width: 30, height: 30)
            })
            .padding(.top, 5)
            .buttonStyle(.plain)
            
            //            if book.selected {
            //                Image(systemName: "checkmark")
            //                    .foregroundColor(.green)
            //                    .frame(width: 25, height: 25)
            //            }
        }
    }
    
    func removeBook(book: Book) {
        var indexes = IndexSet()
        if let index = appData.userData.firstIndex(where: {$0.id == book.id }) {
            indexes.insert(index)
        }
        appData.userData.remove(atOffsets: indexes)
    }
}

#Preview {
    ListViewExample()
        .environment(ApplicationMyData())
}
