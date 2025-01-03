//
//  NotificationData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 19.12.2024.
//

import SwiftUI

#if os(iOS)
@Observable class NotificationData: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    var showValue: String = ""
    @ObservationIgnored var myObject = MyObj()
    @ObservationIgnored var myObserver: NSKeyValueObservation?
    
    override init() {
        super.init()
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        myObserver = myObject.observe(\.text, options: [.new], changeHandler: { obj, value in
            if let newValue = value.newValue {
                self.showValue = "Value: \(newValue)"
            }
        })
    }
    @MainActor
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        let identifier = response.actionIdentifier
        print("Notification Response: \(identifier)")
        if identifier == "deleteButton" {
            print("Delete Message")
        } else if identifier == "inputField" {
            print("Send: \((response as! UNTextInputNotificationResponse).userText)")
        }
    }
//    var total: Int = 0
    var titles: [String] = []
//    let center = NotificationCenter.default
//    var scrollOffset: CGFloat = 0
//    var isLandscape: Bool = false
}
#endif
