//
//  learningSwiftUIApp.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 28.04.2024.
//

import SwiftUI

@main
struct learningSwiftUIApp: App {
    
//    @UIApplicationDelegateAdaptor(CustomAppDelegate.self) var delegate
//    @State var appData = SingletonData.shared
//    @State private var appData = ApplicationData()
//    @Environment(\.scenePhase) var scenePhase
    
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
//            NotificationExample()
//                .environment(NotificationData())
//                .onChange(of: scenePhase){ oldValue, newValue in
//                    if newValue == .active {
//                        print("Scene is active")
//                    } else if newValue == .inactive {
//                        print("Scene is inactive")
//                    } else if newValue == .background {
//                        print("Scene is background")
//                    }
//                }
//            SingletonView()
//                .environment(appData)
//            WebViewExample()
//                .environment(WebData())
//            MediaViewExample()
//                .environment(MediaData())
//            CustomCameraView()
//                .environment(CustomCameraData())
//            VideoViewExample()
//                .environment(VideoData())
//            CustomVideoView()
//                .environment(CustomPlayerData())
//            ColorPickerView()
            MultiplatformView()
        }
        #if os(macOS)
        .commands {
            CommandGroup(replacing: .newItem, addition: { })
            CommandGroup(after: .newItem, addition: {
                Button("Option 1") {
                    print("This is option 1")
                }
            })
        }
        #endif
    }
}

