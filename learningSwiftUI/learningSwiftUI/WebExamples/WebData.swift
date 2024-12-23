//
//  WebData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.12.2024.
//

import SwiftUI
import Observation

@Observable class WebData {
    var webContent: String = ""
    var buttonDisabled: Bool = false
    
    func loadWeb() async {
        buttonDisabled = true
        
        let session = URLSession.shared
        let webURL = URL(string: "https://www.yahoo.com")
        
        do {
            let (data, response) = try await session.data(from: webURL!)
            if let resp = response as? HTTPURLResponse {
                let statusCode = resp.statusCode
                if statusCode == 200 {
                    if let content = String(data: data, encoding: String.Encoding.utf8) {
                        await MainActor.run {
                            webContent = content
                            buttonDisabled = false
                        }
                        print(content)
                    } else {
                        print("Error: Couldn't decode data \(statusCode)")
                    }
                }
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
