//
//  Note.swift
//  Notes Watch App
//
//  Created by Abdulgafur Demirci on 2.05.2025.
//

import Foundation

struct Note: Identifiable, Codable {
    var id: UUID
    var text: String
}
