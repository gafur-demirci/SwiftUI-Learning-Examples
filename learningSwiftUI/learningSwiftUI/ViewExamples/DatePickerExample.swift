//
//  DatePickerExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 10.08.2024.
//

import SwiftUI

struct DatePickerExample: View {
    
//    @State private var selectedDate: Date = Date()
    @State private var selectedDates: Set<DateComponents> = []
    @State private var myDates: String = ""
    
    var body: some View {
        VStack {
            MultiDatePicker("Dates:", selection: $selectedDates)
            Spacer()
            Text(myDates)
//            Text("Date: \(selectedDate.formatted(.dateTime.day().month()))")
//            DatePicker("Date:", selection: $selectedDate, in: Date()..., displayedComponents: .date)
//                .labelsHidden()
//                .datePickerStyle(.wheel)
//            Spacer()
        }
        .padding()
        .onChange(of: selectedDates, initial: false, { old, values in
            let days = values.map({ value in String(value.day!)})
            myDates = days.joined(separator: ",")
        })
    }
}

#Preview {
    DatePickerExample()
}
