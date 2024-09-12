//
//  AsyncAwaitExample.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 11.09.2024.
//

import SwiftUI

enum MyErrors: Error {
    case noData, noImage
}

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
                do {
                    // nine second
                    let imageName = try await loadImage(name: "book10")
                    print(imageName)
                    //                let imageName2 = await loadImage(name: "book2")
                    //                let imageName3 = await loadImage(name: "book3")
                    //                print("\(imageName1), \(imageName2) and \(imageName3)")
                } catch MyErrors.noData {
                    print("Error: No Data Available")
                } catch MyErrors.noImage {
                    print("Error: No Image Available")
                }
            }
            /*
             Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
             print("The time is up")
             myTask.cancel()
             }
             */
        }
    }
    
    func loadImage(name: String) async throws-> String {
        try? await Task.sleep(nanoseconds: 3 * 1000000000)
        
        let error = true
        if error {
            throw MyErrors.noImage
        }
        
//        let result = Task(priority: .background) { () -> String in
//            let imageData = await getMetadata()
//            return "Name: \(name) Size: \(imageData)"
//        }
//        let message = await result.value
        return "Name: \(name)"
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
