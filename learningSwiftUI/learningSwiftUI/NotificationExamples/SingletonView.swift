//
//  SingletonView.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.12.2024.
//

import SwiftUI

struct SingletonView: View {
    @EnvironmentObject private var appData: SingletonData

   var body: some View {
      Text(appData.maintext)
         .padding()
   }
}
#Preview {
    SingletonView()
        .environmentObject(SingletonData.shared)
}
