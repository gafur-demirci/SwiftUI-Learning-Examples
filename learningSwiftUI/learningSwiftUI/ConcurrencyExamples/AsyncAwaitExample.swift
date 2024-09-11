//
//  AsyncAwaitExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 11.09.2024.
//

import SwiftUI

struct AsyncAwaitExample: View {
    
    var thumbnail: String {
        get async {
            try? await Task.sleep(nanoseconds: 3 * 1000000000)
            return "mythumbnail"
        }
    }
    
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
        }
        // task explicitly
        .onAppear {
            Task(priority: .background) {
                // nine second
                let imageName = await thumbnail
                print(imageName)
                //                let imageName2 = await loadImage(name: "book2")
                //                let imageName3 = await loadImage(name: "book3")
                //                print("\(imageName1), \(imageName2) and \(imageName3)")
            }
            /*
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
                print("The time is up")
                myTask.cancel()
            }
             */
        }
    }
    
    func loadImage(name: String) async -> String {
        let result = Task(priority: .background) { () -> String in
            let imageData = await getMetadata()
            return "Name: \(name) Size: \(imageData)"
        }
        let message = await result.value
        return message
        /*
         try? await Task.sleep(nanoseconds: 3 * 1000000000)
         if !Task.isCancelled {
         return "Name \(name)"
         } else {
         return "Task Cancelled"
         }
         */
    }
    func getMetadata() async -> Int {
        try? await Task.sleep(nanoseconds: 3 * 1000000000)
        return 50000
    }
    
}

#Preview {
    AsyncAwaitExample()
}
