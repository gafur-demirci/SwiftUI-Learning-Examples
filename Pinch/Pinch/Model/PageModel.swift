//
//  PageModel.swift
//  Pinch
//
//  Created by Abdulgafur Demirci on 20.04.2025.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-\(imageName)"
    }
}
