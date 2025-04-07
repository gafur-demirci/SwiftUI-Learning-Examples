//
//  CardView.swift
//  Hike
//
//  Created by Abdulgafur Demirci on 7.04.2025.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        
        // MARK: Card
        
        ZStack {
            CustomBackgroundView()
            VStack {
                
                // MARK: - HEADER
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [.customGrayLight, .customGrayMedium]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        Spacer()
                        Button(action: {
                            // ACTION: Show a Sheet
                            print(">>> Start hiking")
                        }, label: {
                            CustomButtonView()
                        })
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic(true)
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                // MARK: - Main Content
                
                
                
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.colorIndigoMedium, .colorSalmonLight]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 256, height: 256)
                    Image("image-1")
                        .resizable()
                        .scaledToFit()
                }
                
                // MARK: - Footer
                
                Button(action: {
                    
                }, label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [.customGreenLight, .customGreenMedium]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                })
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [.customGrayLight, .customGrayMedium]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .cornerRadius(40)
            }
        } //: Card
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
