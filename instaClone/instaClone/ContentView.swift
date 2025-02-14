//
//  ContentView.swift
//  instaClone
//
//  Created by Abdulgafur Demirci on 9.02.2025.
//

import SwiftUI
import FirebaseAuth

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
                    Button("Sign Up") {
                        signUp()
                    }
                    .disabled(userEmail.isEmpty || userPassword.isEmpty )
                }
                .padding()
            }
            .padding()
        }
        .toolbarVisibility(.hidden)
        .onAppear() {
            let currentUser = Auth.auth().currentUser
            if currentUser != nil {
                isAuthenticated = true
            }
        }
    }
    
    func signIn() {
        
        if (userEmail != "" && userPassword != "") {
            Auth.auth().signIn(withEmail: userEmail, password: userPassword) { authData, error in
                if let error = error {
                    print("error signing in: \(error.localizedDescription)")
                    return
                }
                print("user signed in successfully")
                isAuthenticated = true
            }
            
        }
    }
    
    func signUp() {
        print("user signed up")
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                print("error signing up: \(error.localizedDescription)")
                return
            }
            print("user signed up successfully")
            self.isAuthenticated = true
        }
    }
}

#Preview {
    ContentView()
}
