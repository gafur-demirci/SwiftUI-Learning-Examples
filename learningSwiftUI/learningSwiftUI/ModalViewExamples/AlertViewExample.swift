//
//  AlertViewExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 1.09.2024.
//

import SwiftUI

struct AlertViewExample: View {
    
    @State private var name: String = ""
    @State private var openAlert: Bool = false
    
    var body: some View {
        VStack {
            TextField("Insert your Name", text: $name)
                .textFieldStyle(.roundedBorder)
            HStack {
                Spacer()
                Button("Save") {
                    openAlert = name.isEmpty
                }
            }
            Spacer()
        }
        .padding()
        .alert("Error", isPresented: $openAlert, actions: {
            Button("Cancel", role: .cancel, action: {})
            Button("Delete", role: .destructive, action: {
                name = ""
            })
            Button("Save Anyway", role: .none, action: {
                print("Save value")
            })
            
            /*
            Button("Cancel", role: .cancel, action: {
                openAlert = false
            })
             */
        }, message: {
            Text("Insert your name")
        })
    }
}

#Preview {
    AlertViewExample()
}
