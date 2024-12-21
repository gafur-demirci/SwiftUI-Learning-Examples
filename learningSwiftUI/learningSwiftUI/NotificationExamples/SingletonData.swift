//
//  SingletonData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 21.12.2024.
//

import SwiftUI
import Observation

@Observable class SingletonData: ObservableObject {
   var maintext: String
   
   static let shared = SingletonData()
   
   private init() {
      maintext = "Welcome"
   }
}
