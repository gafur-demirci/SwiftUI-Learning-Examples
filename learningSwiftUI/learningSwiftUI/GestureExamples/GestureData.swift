//
//  GestureData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 16.12.2024.
//

import SwiftUI
import Observation
import UniformTypeIdentifiers

struct PictureRepresentation: Identifiable, Codable, Transferable {
    var id = UUID()
    var image: Data
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: PictureRepresentation.self, contentType: .product)
    }
}

extension UTType {
    static var product = UTType(exportedAs: "com.abdulgafur.learningSwiftUI.pictures")
}

@Observable class GestureData {
    var listPictures: [PictureRepresentation]
    
    init() {
        listPictures = [
            PictureRepresentation(image: UIImage(named: "book1")!.pngData()!),
            PictureRepresentation(image: UIImage(named: "book2")!.pngData()!),
            PictureRepresentation(image: UIImage(named: "book3")!.pngData()!)
        ]
    }
}
