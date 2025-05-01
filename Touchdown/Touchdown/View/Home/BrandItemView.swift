//
//  BrandItemView.swift
//  Touchdown
//
//  Created by Abdulgafur Demirci on 1.05.2025.
//

import SwiftUI

struct BrandItemView: View {
    // MARK: - PROPERTY
    
    let brand: Brand
    
    // MARK: - BODY
    
    var body: some View {
      Image(brand.image)
        .resizable()
        .scaledToFit()
        .padding(3)
        .background(Color.white.cornerRadius(12))
        .background(
          RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1)
        )
    }
}

#Preview {
    BrandItemView(brand: brands[0])
}
