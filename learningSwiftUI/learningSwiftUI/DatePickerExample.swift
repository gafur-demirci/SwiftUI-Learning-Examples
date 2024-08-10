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
            DatePicker("Date:", selection: $selectedDate)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DatePickerExample()
}
