//
//  JokesModel.swift
//  jokes
//
//  Created by Abdulgafur Demirci on 2.04.2025.
//

import Foundation

struct Joke: Identifiable, Codable {
    let categories: [String]
    let createdAt: String
    let iconURL: String
    let id, updatedAt: String
    let url: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }
}
