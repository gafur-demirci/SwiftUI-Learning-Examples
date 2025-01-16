//
//  learningSwiftUIApp.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 28.04.2024.
//

import SwiftUI

@available(iOS 18.0, *)
@main
struct learningSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(ArtAppDelegate.self) var delegate
//    @UIApplicationDelegateAdaptor(CustomAppDelegate.self) var delegate
//    @State var appData = SingletonData.shared
//    @State private var appData = ApplicationData()
//    @Environment(\.scenePhase) var scenePhase
//    @State private var appData = MacData()
//    @FocusedValue(\.address) var addressValue: String?
//    @AppStorage("totalItems") var totalItems: Int = 0
    
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
//            MultiplatformView()
//                .environment(appData)
//            LocalizedView()
//                .environment(\.locale,  Locale(identifier: "es"))
//            CustomContainersView()
//            TipViewExamples()
//            RealLifeTabViewExample()
//                .environment(ApplicationMyData.shared)
//            MyCalculator()
//            BirthdayStore()
//            SignUpForm()
//            BookStoreGallery()
//            MyTimer()
//            CatchTheMouse()
//            LandMarks()
//                .environment(LandMarkData())
            ArtBook()
                .environment(ArtData())
        }
        #if os(macOS)
        Settings {
            HStack {
                Stepper("Total Items", value: $totalItems)
                Text(String(totalItems))
                    .font(.title.bold())
            }
            .frame(width: 200, height: 150)
        }
        MenuBarExtra("My Control", systemImage: "phone") {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        NSApplication.shared.terminate(nil)
                    }, label: {
                        Image(systemName: "xmark.circle")
                    })
                }
                .padding()
                Button("Option 1") {
                    print("This is option 1")
                }
                .buttonStyle(.borderedProminent)
                Button("Option 2") {
                    print("This is option 2")
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
            .frame(width: 200, height: 180)
        }
        .menuBarExtraStyle(.window)
        Window("My Window", id: "mywindow") {
            AuxiliaryView()
        }
        .defaultSize(CGSize(width: 200, height: 200))
        .defaultPosition(.bottomTrailing)
        .commandsRemoved()
        .commands {
            CommandGroup(after: .newItem, addition: {
                Button("Option 1") {
                    print("This is option 1")
                }
                .disabled(addressValue == nil)
            })
        }
        #endif
    }
}

