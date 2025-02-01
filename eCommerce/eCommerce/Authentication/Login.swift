//
//  Login.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import SwiftUI
import SwiftData

struct Login: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
            VStack {
                TextField("Kullanıcı Adı", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Şifre", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    loginUser()
                }, label: {
                    Text("Login")
                })
                NavigationLink(destination: Register()) {
                    Text("Sign In")
                }
                .padding()
            }
            .padding()
        }
    }
    
    func loginUser() {
        do {
            let descriptor = FetchDescriptor<User>(
                predicate: #Predicate { $0.username == username && $0.password == password }
            )
            let users = try modelContext.fetch(descriptor)

            if let _ = users.first {
                print("Login Successful")
            } else {
                print("Login Failed")
            }
        } catch {
            print("Error fetching users: \(error)")
        }
    }
}

#Preview {
    Login()
}
