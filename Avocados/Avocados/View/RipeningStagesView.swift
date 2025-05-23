//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by Abdulgafur Demirci on 3.05.2025.
//

import SwiftUI

struct RipeningStagesView: View {
    // MARK: - PROPERTIES
    
    var ripeningStages: [Ripening] = ripeningData
    
    var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
        VStack {
          Spacer()
          HStack(alignment: .center, spacing: 25) {
            ForEach(ripeningStages) { item in
              RipeningView(ripening: item)
            }
          }
          .padding(.vertical)
          .padding(.horizontal, 25)
          Spacer()
        }
      }
      .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    RipeningStagesView()
}
