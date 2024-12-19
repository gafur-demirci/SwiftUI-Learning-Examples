//
//  learningSwiftUIApp.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 28.04.2024.
//

import SwiftUI

@main
struct learningSwiftUIApp: App {
    
    @State private var appData = ApplicationData()
    
    var body: some Scene {
        WindowGroup {
//            ButtonExamples()
//            TextFieldViewExamples()
//            ToggleViewExamples()
//            SliderViewExamples()
//            ProgressViewExamples()
//            StepperViewExamples()
//            ContentView()
//                .environment(appData)
//            ListOfViewsExample()
//                .environment(appData)
//            GridViewExample()
//                .environment(appData)
//            ListViewExample()
//                .environment(appData)
//            TableViewExample()
//                .environment(appData)
//            PickerViewExample()
//            DatePickerExample()
//            FormViewExample()
//            MultipleViewsExample()
//                .environment(appData)
//            UserDefaultsExample()
//                .environment(ApplicationData())
//            SwiftDataExample()
//                .environment(ApplicationData())
//                .modelContainer(for: [MineBook.self], inMemory: true)
            NotificationExample()
                .environmentObject(NotificationData())
        }
    }
}

