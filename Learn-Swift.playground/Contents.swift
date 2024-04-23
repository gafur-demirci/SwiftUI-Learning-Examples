import UIKit
import Foundation
import RegexBuilder
import CoreGraphics

/// PROTOCOLS

/// defining protocols - defining multiple structs that conform to the same protocol
//protocol Printer {
//    var name: String { get set }
//    func printDescription()
//}
//
//struct Employees: Printer {
//    var name: String
//    var age: Int
//    
//    func printDescription() {
//        print(
//            "Description: \(name) \(age)"
//        )
//    }
//}
//
//struct Offices: Printer{
//    var name: String
//    var employees: Int
//    
//    func printDescription() {
//        print("Description: \(name) \(employees)")
//    }
//}

//let employee = Employees(name: "Hagi",age: 50)
//let office = Offices(name:"Munih", employees: 40)
////employee.printDescription()
////office.printDescription()
//
///// using protocols as data types
///// accessing the instances own properties
//var list: [Printer] = [employee,office]
//for element in list{
//    if let employee = element as? Employees{
//        print(employee.name)
//    }
//    element.printDescription()
//}
//
///// returning values of a protocol data type
//func getFile(type: Int) -> Printer {
//    var data: Printer!
//    if type == 1 {
//        data = Employees(name: "Almo", age: 30)
//    }else if type == 2 {
//        data = Offices(name: "Jail", employees: 2)
//    }
//    return data
//}
//let file = getFile(type: 2)
//file.printDescription()

/// defining generic protocols

//protocol Printer{
//    associatedtype protype
//    var name: protype { get set }
//}
//
//struct Employees: Printer{
//    var name: String
//}
//let employee = Employees(name: "Steve")
//print(employee.name)

/// swift protocols

/// conforming to the equatable protocol
/// adding a type constraint to a generic function
//struct Employees: Equatable{
//    var name: String
//    var age: Int
//    
//    /// overrideing for == func used property that knows
////    static func == (value1: Employees, value2: Employees) -> Bool {
////        return value1.age == value2.age
////    }
//}

//func compareValues<T: Equatable> (value1: T, value2: T) -> String {
//    return value1 == value2 ? "equal" : "different"
//}
//
//let employee1 = Employees(name:"Steve", age:61)
//let employee2 = Employees(name:"Fred", age:41)
//
////let message = employee1 == employee2 ? "Equal" : "Different"
//let message = compareValues(value1: employee1, value2: employee2)
//print(message)

/// using the numeric protocol to set a type contraint
//func calculateResult<T: Numeric>(value1: T, value2:T){
//    print(value1 + value2)
//}
//calculateResult(value1: 3.5, value2: 4)

/// conforming to the comparable protocol

//struct Employees: Comparable{
//    var name: String
//    var age: Int
//    
//    static func > (value1: Employees, value2: Employees) -> Bool {
//        return value1.age > value2.age
//    }
//    static func < (value1: Employees, value2: Employees) -> Bool {
//        return value1.age < value2.age
//    }
//    static func >= (value1: Employees, value2: Employees) -> Bool {
//        return value1.age >= value2.age
//    }
//    static func <= (value1: Employees, value2: Employees) -> Bool {
//        return value1.age <= value2.age
//    }
//}
//employee1 > employee2
//employee1 < employee2
//employee1 >= employee2
//employee1 <= employee2

/// conforming to the hashable protocol

//struct Employees: Hashable {
//    var name: String
//    var age: Int
//}
//
//let employee1 = Employees(name:"Steve", age:61)
//let employee2 = Employees(name:"Fred", age:41)
//
//let list: Set<Employees> = [employee1,employee2]
//for item in list{
//    print(item.name)
//}

/// defining own hash value

//struct Employees: Hashable {
//    var name: String
//    var age: Int
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//    }
//}
//
//let employee1 = Employees(name:"Steve", age:61)
//let employee2 = Employees(name:"Fred", age:41)
//
//print(employee1.hashValue)

/// conforming to the caseiterable protocol

//enum Departments: CaseIterable{
//    case mail
//    case marketing
//    case managing
//}
//var message = ""
//for department in Departments.allCases {
//    message += "\(department) "
//}
//print(message)

/// EXTENSIONS

// extending a protocol
protocol Printer{
    var name: String { get set }
//    func printDescription()
}
// if not use extension for printDescription func, struct must define this func capabilities, but u use extension for that func all struct using same func by not overriding use your extension definition
// when the extension func used and struct inside that same func use, the extension can overrided

extension Printer{
    func printDescription(){
        print("The name is \(name)")
    }
}
struct Employees: Printer {
//    func printDescription() {
//        print("The name \(name)")
//    }
    
    var name: String
    var age: Int
}
struct Offices: Printer{
    func printDescription() {
        print("The name \(name)")
    }
    
    var name: String
    var employees: Int
}

let employee = Employees(name:"Jhon",age: 22)
let office = Offices(name:"Mail", employees: 2)

//employee.printDescription()
//office.printDescription()

// extending data types
extension Int{
    func printDescription(){
        print("The number is \(self)")
    }
}
let myNum = 25
//myNum.printDescription()

// extending custom data types

struct Department{
    var name: String
    var employees: Int
}

extension Department{
    func printBadge(){
        print("Name: \(name) - Employees: \(employees)")
    }
}

let department = Department(name: "Mail", employees: 23)
//department.printBadge()

// defining a conditional extension

struct Team<T>{
    var value: T
}

extension Team where T == Int{
    func doubleValue(){
        print("\(value) times 2 = \(value * 2)")
    }
}
let team = Team(value: 22)
//team.doubleValue()

/// customizing string interpolation

extension String.StringInterpolation{
    mutating func appendInterpolation(celsius value: Double){
        let fahrenheit = ((value * 9)/5) + 32
        appendLiteral(String(fahrenheit))
    }
}
//print("Temperature in Fahrenheit \(celsius: 25)")

/// DELEGATES

/// delegating tasks

//struct Salary {
//    func showMoney(name: String, salary: Double) {
//        print("The salary of \(name) is \(salary)")
//    }
//}
//
//struct Employees2 {
//    var name: String
//    var money: Double
//    
//    var delegate: Salary
//    
//    func generateReport() {
//        delegate.showMoney(name: name, salary: money)
//    }
//}
//
//let salary = Salary()
//let emp = Employees2(name: "Jhon", money: 200.50, delegate: salary)
//emp.generateReport()

/// delegating with protocols

//protocol SalaryProtocol {
//    func showMoney(name: String, salary: Double)
//}
//
//struct Salary: SalaryProtocol {
//    func showMoney(name: String, salary: Double) {
//        print("The salary of \(name) is \(salary)")
//    }
//}
//
//struct BasicSalary: SalaryProtocol {
//    func showMoney(name: String, salary: Double) {
//        if salary > 40000 {
//            print("Salary is over the minimum")
//        }else {
//            print("The salary of \(name) is \(salary)")
//        }
//    }
//}
//
//struct Employees2 {
//    var name: String
//    var money: Double
//    
//    var delegate: SalaryProtocol
//    
//    func generateReport() {
//        delegate.showMoney(name: name, salary: money)
//    }
//}
//
//let salary = Salary()
//var emp = Employees2(name: "Jhon", money: 20000, delegate: salary)
//
//emp.delegate = BasicSalary()
//emp.generateReport()

/// FRAMEWORKS

// applying math functions

//let square = sqrt(4.0)
//let power = pow(2.0,2.0)
//let maximum = max(square,power)

//print("The maximum value is \(maximum)")

/// String struct class can use NSString functionality

// Creating an NSString object
//let message: NSString = NSString("Hello")
//print(message)

// casting a string value into an NSString object
//let newMsg = "Hello World"
//print(newMsg as NSString)

// creating a formatted string
// %d -> Int, %f -> float numbers, %g -> remove zeros, %@ -> objects nad structures
//var age = 44
//var myText = String.localizedStringWithFormat("My age is %d", age)
//print(myText)

// formatting numbers
//let leng = 12.3472
//let total = 54
//let decimals = String.localizedStringWithFormat("Decimals: %2f", leng)
//let digits = String.localizedStringWithFormat("Digits: %5d", total)

//print(decimals)
//print(digits)

// comparing strings values

//var fruit = "Oranges"
//var search = "Apple"
//
//var result = fruit.compare(search)
//
//switch result {
//case .orderedSame:
//    print("Fruit and Search are equal")
//case .orderedDescending:
//    print("Fruit follows Search")
//case .orderedAscending:
//    print("Fruit precedes Search")
//}

// comparing strings values with options

//var fruit = "Oranges"
//var search = "ORANGES"
//
//var result = fruit.compare(search, options: .caseInsensitive)
//
//switch result {
//case .orderedSame:
//    print("Fruit and Search are equal")
//case .orderedDescending:
//    print("Fruit follows Search")
//case .orderedAscending:
//    print("Fruit precedes Search")
//}

// comparing only a range of characters

//var phone = "905-525-6666"
//var search = "905"
//var start = phone.startIndex
//var end = phone.firstIndex(of: "-")
//
//if let endIndex = end {
//    let result = phone.compare(search, options: .caseInsensitive, range: start..<endIndex)
//    if result == .orderedSame {
//        print("The area code is the same")
//    }else {
//        print("The are code is different")
//    }
//}

// searching and replacing characters in a string

//var text = "The Suitcase is Black"
//var search = "black"
//
//search = search.trimmingCharacters(in: .whitespacesAndNewlines)
//
//var range = text.range(of: search, options: .caseInsensitive)
//if let rangeToReplace = range {
//    text.replaceSubrange(rangeToReplace, with: "Red")
//}
//
//print(text)

// getting the components of a string

//let phone = "905-525-6666"
//let elements = phone.components(separatedBy: "-")
//print(elements.last!)

// creating and reading an NSRange value

//let ranges = NSRange(4..<10)
//print("Initial: \(ranges.location)")
//print("Length: \(ranges.length)")

// converting a range of string indexes

//let texts = "Hello World"
//if let start = texts.firstIndex(of: "W") {
//    let newrange = NSRange(start..., in: texts)
//    print("Initial: \(newrange.location)")
//    print("Length: \(newrange.length)")
//}

// working with NSNumber objects

//var myNums = NSNumber(value: 35)
//var myDouble = myNums.doubleValue * 2

// formatting a number - rounding a number

//let myNumber: Double = 32.56789
//let textF = myNumber.formatted(.number.precision(.fractionLength(2)).rounded(rule: .down))
//print(textF)

// disabling grouping

//let myNumber: Int = 32000000
//let textF = myNumber.formatted(.number.grouping(.automatic))
//print(textF)

// adding the sign

//let myNumber: Int = 32000000
//let textF = myNumber.formatted(.number.sign(strategy: .always(includingZero: false)))
//print(textF)

// formatting the number as a percentage value - formatting currency values

//let myNumber: Int = 32
//let textF = myNumber.formatted(.percent)
//let textF = myNumber.formatted(.currency(code: "TRY"))
//print(textF)

// storing dates with Date structures

//var currentDate = Date()
//var nextDay = Date(timeIntervalSinceNow: 24 * 60 * 60)
//var tenDays = Date(timeInterval: 10 * 24 * 3600, since: nextDay)

// comparing two dates

//var days = 7
//var today = Date()
//var event = Date(timeIntervalSinceNow: Double(days) * 24 * 3600)
//
//if today.compare(event) == .orderedAscending {
//    let interval = event.timeIntervalSince(today)
//    print("We have to wait \(interval) seconds")
//    
//}

// extracting components from a date

//var today =  Date()
//let calendar = Calendar.current
//var components = calendar.dateComponents([.year], from: today)
//print("The year is \(components.year!)")

// extracting multiple components from a date

//var today =  Date()
//let calendar = Calendar.current
//var components = calendar.dateComponents([.year, .month, .day], from: today)
//print("Today \(components.year!) \(components.month!) \(components.day!)")

// creating a new date form single components

//let calendar = Calendar.current
//var comp = DateComponents()
//comp.year = 1970
//comp.month = 8
//comp.day = 21
//
//var birtday = calendar.date(from: comp)

// initializing measurement structures

//var length = Measurement(value: 32, unit: UnitLength.centimeters)
//var width = Measurement(value: 5, unit: UnitLength.centimeters)
//var total = length + width

// adding two values of different lengths

//var length = Measurement(value: 32, unit: UnitLength.kilometers)
//var width = Measurement(value: 5, unit: UnitLength.centimeters)
//var total = length + width

// using regular expression

//let message = "Name: John"
//let regex = /Name:\s+[a-zA-Z]+/
//
//if let match = message.firstMatch(of: regex) {
//    let found = match.output
//    print(found)
//}

// capturing values with subexpresions

//let message = "Name: John"
//let regex = /Name:\s+([a-zA-Z]+)/
//
//if let match = message.firstMatch(of: regex) {
//    let found = match.output.1
//    print(found)
//}

// capturing multiple values

//let messages = "Name: John, Name: George, Name: David"
//let regex = /Name:\s+([a-zA-Z]+)/
//
//let matches = messages.matches(of: regex)
//
//if !matches.isEmpty {
//    let names = matches.map( { value in
//        return value.output.1
//    })
//    
//    let listofName = names.joined(separator: ", ")
//    print("Names are: \(listofName)")
//}

// processing multiple lines of text with a regular expression

//let message = """
//Jhon
//George
//David
//"""
//
//let seperator = /\n/
//let lines = message.split(separator: seperator)
//print(lines)

// replacing the characters that match a regular expression

//let message = """
//Jhon
//George
//David
//"""
//
//let seperator = /\n/
//let result = message.replacing(seperator, with: ", ")
//print(result)

// defining a regular expression with a Regex Builder

//let regex = Regex {
//    "Name:"
//    OneOrMore(.whitespace)
//    OneOrMore {
//        CharacterClass("a"..."z", "A"..."Z")
//    }
//}
//
//let message = "Name: John"
//let result = message.matches(of: regex)
//
//if !result.isEmpty {
//    print(result[0].output)
//}

// capturing a value from a Regex Builder

//let regex = Regex {
//    "Name:"
//    OneOrMore(.whitespace)
//    Capture {
//        One(CharacterClass("A"..."Z"))
//        OneOrMore {
//            CharacterClass("a"..."z")
//        }
//    }
//    
//}
//
//let message = "Name: John"
//let result = message.matches(of: regex)
//
//if let name = result.first?.output.1 {
//    print("The name is: \(name)")
//}

// transforming values to the right data type

//let message = "09 units, stock 190"
//let regex = Regex {
//    Capture {
//        OneOrMore(.digit)
//    } transform: { value in
//            Int(value)
//    }
//    OneOrMore(.any, .reluctant)
//    Capture {
//        OneOrMore(.digit)
//    } transform: { value in
//            Int(value)
//    }
//}
//
//let result = message.matches(of: regex)
//
//if let units = result.first?.output.1, let stock = result.first?.output.2 {
//    let total = units + stock
//    print("Final Stock: \(total)")
//}

// matching dates and currency

//let seperator = /\n/
//let content = """
//06/15/2020 Lamp $35.00
//06/21/2020 Desk $250.50
//06/29/2020 Chair $129.00
//"""
//
//let regex = Regex {
//    Capture {
//        One(.date(.numeric, locale: .current, timeZone: .current))
//    }
//    OneOrMore(.whitespace)
//    Capture {
//        OneOrMore(CharacterClass("a"..."z", "A"..."Z"))
//    }
//    OneOrMore(.whitespace)
//    Capture {
//        One(.localizedCurrency(code: "USD", locale: .current))
//    }
//}
//
//let lines = content.split(separator: seperator)
//
//for line in lines {
//    if let result = line.firstMatch(of: regex) {
//        print("Date: \(result.output.1.formatted(date: .complete, time: .omitted))")
//        print("Item: \(result.output.2)")
//        print("Price: \(result.output.3)")
//    }
//}

// initializing core graphic structures

var myFloat: CGFloat = 25
var mySize: CGSize = CGSize(width: 250, height: 250)
var myPoint: CGPoint = CGPoint(x: 20, y: 50)
var myRect: CGRect = CGRect(origin: myPoint, size: mySize)
