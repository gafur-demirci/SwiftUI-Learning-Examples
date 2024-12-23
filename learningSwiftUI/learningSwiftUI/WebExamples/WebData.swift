//
//  WebData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 23.12.2024.
//

import SwiftUI
import Observation

struct Post: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

@Observable class WebData {
    var listOfPosts: [Post] = []
    
    init() {
        Task(priority: .high) {
            await loadJSON()
        }
    }
    
    func loadJSON() async {
        let session = URLSession.shared
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        do {
            let (data, response) = try await session.data(from: url!)
            if let resp = response as? HTTPURLResponse {
                let status = resp.statusCode
                if status == 200 {
                    let decoder = JSONDecoder()
                    if let posts = try? decoder.decode([Post].self, from: data) {
                        await MainActor.run {
                            listOfPosts = posts
                        }
                    } else {
                        print("Error: \(status)")
                    }
                }
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
