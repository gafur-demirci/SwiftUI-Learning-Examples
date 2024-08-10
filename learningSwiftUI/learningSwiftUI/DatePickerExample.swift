//
//  DatePickerExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 10.08.2024.
//

import SwiftUI

struct DatePickerExample: View {
    
    @State private var selectedDate: Date = Date()
    
    var body: some View {
        VStack {
            Text("Date: \(selectedDate.formatted(.dateTime.day().month()))")
            DatePicker("Date:", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(.wheel)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DatePickerExample()
}
