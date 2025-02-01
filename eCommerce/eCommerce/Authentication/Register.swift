//
//  Register.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import SwiftUI

struct Register: View {
    @Environment(\.modelContext) private var modelContext
    @State private var username = ""
    @State private var password = ""
    @State private var userType: UserType = .customer
    
    var body: some View {
        VStack {
            TextField("Kullanıcı Adı", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Şifre", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Picker("Kullanıcı Tipi", selection: $userType) {
                Text("Admin").tag(UserType.admin)
                Text("Müşteri").tag(UserType.customer)
                Text("Satıcı").tag(UserType.seller)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button("Kayıt Ol") {
                
                let newUser = User(username: username, password: password, userType: userType, lastLoginDate: nil, profileImageData: nil)
                modelContext.insert(newUser)
                do {
                    try modelContext.save()
                    print("User Saved!")
                } catch {
                    print("Veriler kaydedilemedi: \(error.localizedDescription)")
                }
                
            }
            .disabled(username.isEmpty || password.isEmpty || userType.rawValue == "")
            .padding()
        }
        .padding()
    }
}

#Preview {
    Register()
}
