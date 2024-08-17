//
//  ApplicationData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.07.2024.
//

import SwiftUI
import Observation

struct Book: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var author: String
    var cover: String
    var year: Int
    var selected: Bool
    
    var displayYear: String {
        get {
            return String(year)
        }
    }
}

struct MainItems: Identifiable, Hashable {
    var id = UUID()
    var name: String!
    var options: [MainItems]?
}

struct ConsumableItem: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var calories: Int
    var included: Bool
}

struct Employees: Identifiable {
    let id = UUID()
    var name: String
    var position: String
    var subordinates: [Employees]
}


@Observable class ApplicationData {
    
    @ObservationIgnored var userData: [Book] {
        didSet {
            filterValues(search: "")
        }
    }
    
    var title: String = "Default Title"
    //var titleInput: String = ""
    //var userData: [Book] = []
    var items: [MainItems] = []
    var listOfItems: [ConsumableItem] = []
    var listOfEmployees: [Employees] = []
    
    var filteredItems: [Book] = []
    /*
    func filterValues(search: String, scope: Scopes = .title) {
        if search.isEmpty {
            filteredItems = userData.sorted(by: { $0.title < $1.title })
        } else {
            let list = userData.filter({ item in
                let value = scope == .title ? item.title : item.author
                return value.localizedStandardContains(search)
            })
            filteredItems = list.sorted(by: { $0.title < $1.title })
        }
    }
    */
    
    func filterValues(search: String, author: String = "") {
        if search.isEmpty && author.isEmpty {
            filteredItems = userData.sorted(by: { $0.title < $1.title })
        } else {
            let list = userData.filter({ item in
                var valid = true
                if !author.isEmpty && author != item.author {
                    valid = false
                }
                if valid && !search.isEmpty && !item.title.localizedStandardContains(search) {
                    valid = false
                }
                return valid
            })
            filteredItems = list.sorted(by: { $0.title < $1.title })
        }
    }
    
    init() {
        userData = [
            Book(title: "Steve Jobs", author: "Walter Isaacson", cover: "book1", year: 2011, selected: false),
            Book(title: "HTML5 for Masterminds", author: "J.D Gauchat", cover: "book2", year: 2017, selected: false),
            Book(title: "The Road Ahead", author: "Bill Gates", cover: "book3", year: 1995, selected: false),
            Book(title: "The C Programming Language", author: "Brian W. Kernighan", cover: "book4", year: 1988, selected: false),
            Book(title: "Being Digital", author: "Nicholas Negroponte", cover: "book5", year: 1996, selected: false),
            Book(title: "Onyl the Paranoid Survive", author: "Andrew S. Grove", cover: "book6", year: 1999, selected: false),
            Book(title: "Accidental Empires", author: "Robert X. Cringely", cover: "book7", year: 1996, selected: false),
            Book(title: "Bobby Fisher Teached Chees", author: "Bobby Fisher", cover: "book8", year: 1982, selected: false),
            Book(title: "New Guide to Science", author: "Isaac Asimov", cover: "book9", year: 1993, selected: false),
            Book(title: "Christine", author: "Stephen King", cover: "book10", year: 1983, selected: false),
            Book(title: "IT", author: "Stephen King", cover: "book11", year: 1987, selected: false),
            Book(title: "Ending Aging", author: "Aubrey de Grey", cover: "book12", year: 2007, selected: false)
        
        ]
        
        items = [
            MainItems(name: "Food", options: [
                MainItems(name: "Oatmeal"),
                MainItems(name: "Bagels"),
                MainItems(name: "Brownies"),
                MainItems(name: "Cheese", options: [
                    MainItems(name: "Roquefort"),
                    MainItems(name: "Mozzarella"),
                    MainItems(name: "Chedar")
                ]),
                MainItems(name: "Cookies"),
                MainItems(name: "Donuts")
            ]),
            MainItems(name: "Beverages", options: [
                MainItems(name: "Coffee"),
                MainItems(name: "Juice"),
                MainItems(name: "Lemonade")
            ])
        ]
        
        listOfItems = [
            ConsumableItem(name: "Bagels", category: "Baked", calories: 250, included: false),
            ConsumableItem(name: "Brownies", category: "Baked", calories: 466, included: false),
            ConsumableItem(name: "Butter", category: "Dairy", calories: 717, included: false),
            ConsumableItem(name: "Cheese", category: "Dairy", calories: 402, included: false),
            ConsumableItem(name: "Juice", category: "Beverages", calories: 23, included: false),
            ConsumableItem(name: "Lemonade", category: "Beverages", calories: 40, included: false),
        
        ]
        
        let emp1 = Employees(name: "Sander", position: "Subordinate", subordinates: [])
        let emp2 = Employees(name: "Annie", position: "Subordinate", subordinates: [])
        let emp3 = Employees(name: "Charlie", position: "Subordinate", subordinates: [])
        let emp4 = Employees(name: "Sebastian", position: "Subordinate", subordinates: [])
        let emp5 = Employees(name: "Bill", position: "Subordinate", subordinates: [])
        
        listOfEmployees.append(Employees(name: "Robert", position: "Manager", subordinates: [emp1,emp2,emp3]))
        listOfEmployees.append(Employees(name: "Anna", position: "Manager", subordinates: [emp4,emp5]))
        
        filterValues(search: "")
    }
}
