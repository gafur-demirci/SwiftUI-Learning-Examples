//
//  FaceIdCheck.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 4.02.2025.
//

import SwiftUI
import LocalAuthentication

struct FaceIdCheck: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                let authContext = LAContext()
                var error: NSError?
                
                if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                    print("Face ID Auth is available")
                    authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Face ID Auth Test") { success, error in
                        if success {
                            DispatchQueue.main.async {
                                print("Face ID Auth successful")
                            }
                        } else {
                            if let error = error {
                                DispatchQueue.main.async {
                                    print("Face ID Auth failed: \(error.localizedDescription)")
                                }
                            }
                        }
                    }
                } else {
                    print("Face ID Auth is not available")
                }
            }
    }
}

#Preview {
    FaceIdCheck()
}
