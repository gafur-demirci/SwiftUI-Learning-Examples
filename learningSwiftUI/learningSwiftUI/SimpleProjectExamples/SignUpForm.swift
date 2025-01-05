//
//  SignUpForm.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 4.01.2025.
//

import SwiftUI

struct SignUpForm: View {
    
    @State var userName: String = ""
    @State var password: String = ""
    @State var secondPassword: String = ""
    @State var openAlert: Bool = false
    @State var alertMessage: String = ""
    @State var alertTitle: String = ""
    @State var isSecure: Bool = true
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .center) {
                Spacer()
                Text("User Sign Up")
                Spacer()
                TextField("User Name", text: $userName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Group {
                    if isSecure {
                        SecureField("Enter your password", text: $password)
                    } else {
                        TextField("Enter your password", text: $password)
                    }
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {
                            isSecure.toggle()
                        }) {
                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 30)
                    }
                )
                Group {
                    if isSecure {
                        SecureField("Password Again", text: $secondPassword)
                    } else {
                        TextField("Password Again", text: $secondPassword)
                    }
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {
                            isSecure.toggle()
                        }) {
                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 30)
                    }
                )
//                SecureField("Password", text: $password)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
//                SecureField("Password Again", text: $secondPassword)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
                Spacer()
                Button("Sign Up") {
                    let nameRes = checkName()
                    let passRes = checkPassword()
                    if nameRes && passRes {
                        alertTitle = "Success"
                        alertMessage = "User Signed Up"
                        openAlert = true
                        print("User Signed Up")
                    } else {
                        openAlert = true
                    }
                        
                }
                .alert(alertTitle, isPresented: $openAlert, actions: {
                    Button("Cancel", role: .cancel, action: {})
                    Button("Ok", role: .none, action: {
                        print("Save value")
                    })
                }, message: {
                    Text(alertMessage)
                })
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .padding()
                Spacer()
            }
            .padding()
        }
    }
    
    func checkPassword() -> Bool {
        if password.isEmpty || secondPassword.isEmpty {
            alertMessage = "Please enter both passwords"
            return false
        } else if password != secondPassword {
            alertMessage = "Passwords do not match"
            return false
        }
        return true
    }
    
    func checkName() -> Bool {
        if userName.isEmpty {
            alertMessage = "Please enter your name"
            return false
        }
        return true
    }
}

#Preview {
    SignUpForm()
}
