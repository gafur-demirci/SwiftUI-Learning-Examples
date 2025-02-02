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
    @Environment(UserSessionManager.self) private var userSession
    @Query private var users: [User]
    @State private var username = ""
    @State private var password = ""
    @State private var userType: UserType?
    @State private var isLoggedIn: Bool = false
    
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
                NavigationLink("", isActive: $isLoggedIn) {
                    chekcNavigate()
                }
                .hidden()
                NavigationLink(destination: Register()) {
                    Text("Sign In")
                }
                .padding()
            }
            .padding()
        }
        .navigationTitle("Login")
    }
    
    private func loginUser() {
        do {
            let descriptor = FetchDescriptor<User>(
                predicate: #Predicate { $0.username == username && $0.password == password }
            )
            let users = try modelContext.fetch(descriptor)

            if let user = users.first {
                print("Login Successful")
                userSession.login(user: user)
                userType = user.userType
                isLoggedIn = true
            } else {
                print("Login Failed")
            }
        } catch {
            print("Error fetching users: \(error)")
        }
    }
    
    @ViewBuilder
    func chekcNavigate() -> some View {
        switch userType {
        case .admin:
//            print("Admin login")
            AddProduct()
        case .customer:
//            print( "Customer login")
            ContentView()
        case .seller:
            Text("Seller")
//            print( "Seller login")
        case .none:
            Text("None")
        }
    }
}

#Preview {
    Login()
}
