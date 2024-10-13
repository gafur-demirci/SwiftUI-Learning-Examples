//
//  UserDefaultsExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.10.2024.
//

import SwiftUI

struct UserDefaultsExample: View {
    
//    @AppStorage("counter") var myCounter: Double = 0
//    @AppStorage("interval") var myInterval = Date.timeIntervalSinceReferenceDate
//    @State private var message: String = ""
    @Environment(ApplicationData.self) private var appData
    @AppStorage("cornerSize") var cornerSize: Double = 0
    @AppStorage("showYear") var showYear: Bool = true
    @AppStorage("showCover") var showCover: Bool = true
    
    var body: some View {
        NavigationStack {
            List(appData.userData) { book in
                VStack {
                    HStack(alignment: .top) {
                        if showCover {
                            Image(book.cover)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(cornerSize)
                                .frame(width: 80, height: 100)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            Text(book.title)
                                .bold()
                            Text(book.author)
                            if showYear {
                                Text(book.displayYear)
                                    .font(.caption)
                            }
                        }
                        .padding(.top, 5)
                        Spacer()
                    }
                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 5)
                }
            }
            .navigationTitle("Books")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Settings", destination: {
                        UserSettingsView()
                    }
                )
                }
            }
        }
        /*
        HStack {
            Text("\(message)")
                .lineLimit(nil)
            
            /*
            Stepper("", value: $myCounter)
                .labelsHidden()
            Text("\(myCounter.formatted(.number.precision(.fractionLength(0))))")
                .font(.title)
             */
        }
        .onAppear {
            let calendar = Calendar.current
            let lastDate = Date(timeIntervalSinceReferenceDate: myInterval)
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: lastDate, to: Date())
            message = "You haven't used the app in \(components.year!) years, \(components.month!) months, \(components.day!) days, \(components.hour!) hours, \(components.minute!) minutes, and \(components.second!) seconds"
            myInterval = Date.timeIntervalSinceReferenceDate
            
        }
    }
}

#Preview {
    UserDefaultsExample()
}
