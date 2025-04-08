//
//  CustomListRowView.swift
//  Hike
//
//  Created by Abdulgafur Demirci on 8.04.2025.
//

import SwiftUI

struct CustomListRowView: View {
    
    // MARK: - PROTERTIES
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
            } else if (rowLinkLabel != nil) && (rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string: (rowLinkDestination!))!)
                    .foregroundStyle(.pink)
                    .fontWeight(.heavy)
            }
            else {
                EmptyView()
            }
        } label: {
            // Label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
                    .fontWeight(.medium)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(rowLabel: "Hike", rowIcon: "apps.iphone", rowContent: "Application", rowTintColor: .blue)
    }
}
