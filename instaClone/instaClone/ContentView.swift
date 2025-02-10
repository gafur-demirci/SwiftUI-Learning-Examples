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
    @State private var isAuthenticated = false
    
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
                    Button("Sign In") {
                        signIn()
                    }
                    .navigationDestination(isPresented: $isAuthenticated) {
                        MainView()
                    }
                    Spacer()
                    NavigationLink("Sign Up", destination: SignUpView())
                }
                .padding()
            }
            .padding()
        }
        .toolbarVisibility(.hidden)
    }
    
    func signIn() {
        print("user signed in")
        isAuthenticated = false
    }
}

#Preview {
    ContentView()
}
