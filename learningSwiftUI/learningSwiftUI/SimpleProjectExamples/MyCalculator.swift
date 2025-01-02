//
//  MyCalculator.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 2.01.2025.
//

import SwiftUI

struct MyCalculator: View {
    
    @State private var result: Double = 0
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    
    var body: some View {
        VStack {
            TextField("Insert First Number", text: $firstNumber)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            TextField("Insert Second Number", text: $secondNumber)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            HStack {
                Button("+") {
                    result = Double(firstNumber)! + Double(secondNumber)!
                }
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .padding()
                Button("-") {
                    result = Double(firstNumber)! - Double(secondNumber)!
                }
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .padding()
                Button("*") {
                    result = Double(firstNumber)! * Double(secondNumber)!
                }
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .padding()
                Button("/") {
                    result = Double(firstNumber)! / Double(secondNumber)!
                }
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .padding()
            Text("Calculated Result")
            Text(String(result))
        }
        .padding()
    }
}

#Preview {
    MyCalculator()
}
