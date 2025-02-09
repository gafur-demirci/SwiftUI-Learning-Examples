//
//  ContentView.swift
//  instaClone
//
//  Created by Abdulgafur Demirci on 9.02.2025.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                
                Text("Insta Clone")
                
                TextField(text: $userEmail, label: {
                    Text("E-Mail")
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                SecureField(text: $userPassword, label: {
                    Text("Password")
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                HStack {
                    NavigationLink (LocalizedStringKey("Sign In"), destination: MainView())
                    Spacer()
                    NavigationLink (LocalizedStringKey("Sign Up"), destination: SignUpView())
                }
                .padding()
                
            }
            .padding()
        }
    }
    
    func signIn() {
        
    }
    
    func signUp() {
        
    }
}

#Preview {
    ContentView()
}
