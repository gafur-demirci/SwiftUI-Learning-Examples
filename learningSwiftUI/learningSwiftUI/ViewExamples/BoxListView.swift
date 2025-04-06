//
//  BoxListView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 28.12.2024.
//

import SwiftUI

struct BoxListView<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack {
            if #available(iOS 18.0, *) {
                ForEach(subviews: content) { subview in
                    //let color = subviews.count > 2 ? Color.red : Color.blue
                    let values = subview.containerValues
                    
                    //ForEach(subviews) { subview in
                    HStack {
                        subview
                            .padding()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .border(.red, width: values.showBorder ? 5 : 0)
                    .padding(5)
                    //}
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

@available(iOS 18.0, *)
extension ContainerValues {
    @Entry var showBorder: Bool = true
}

extension View {
    func showBorder(_ show: Bool) -> some View {
        if #available(iOS 18.0, *) {
            return containerValue(\.showBorder, show)
        }
        return Text("Error Occured")
    }
}
