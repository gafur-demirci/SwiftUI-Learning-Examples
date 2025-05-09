//
//  FormRowLinkView.swift
//  Todo
//
//  Created by Abdulgafur Demirci on 4.05.2025.
//

import SwiftUI

struct FormRowLinkView: View {
    
    // MARK: - PROPERTIES
    
    var icon: String
    var color: Color
    var text: String
    var link: String
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(.white)
            } //: ZSTACK
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text)
                .foregroundStyle(.gray)
            
            Spacer()
            
            Button(action: {
                // OPEN A LINK
                guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else { return }
                UIApplication.shared.open(url as URL)
                
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .default))
            })
            .tint(Color(.systemGray2))
            
        } //: HSTACK
    }
}

#Preview {
    FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://www.softtech.com.tr")
}
