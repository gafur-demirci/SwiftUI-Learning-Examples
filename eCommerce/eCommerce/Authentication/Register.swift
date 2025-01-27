//
//  Register.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import SwiftUI

struct Register: View {
//    @ObservedObject var userManager: UserManager
    @State private var username = ""
    @State private var password = ""
    @State private var userType: User.UserType = .customer
    
    var body: some View {
        VStack {
            TextField("Kullanıcı Adı", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Şifre", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Picker("Kullanıcı Tipi", selection: $userType) {
                Text("Admin").tag(User.UserType.admin)
                Text("Müşteri").tag(User.UserType.customer)
                Text("Satıcı").tag(User.UserType.seller)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button("Kayıt Ol") {
//                userManager.registerUser(username: username, password: password, userType: userType)
//                let newUser = User()
//                modelContext.insert(newUser)
//                do {
//                    try modelContext.save()
//                    print("User Saved!")
//                } catch {
//                    print("Veriler kaydedilemedi: \(error.localizedDescription)")
//                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    Register()
}
