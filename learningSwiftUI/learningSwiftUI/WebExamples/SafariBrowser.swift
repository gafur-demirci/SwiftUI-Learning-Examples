//
//  SafariBrowser.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 22.12.2024.
//

import SwiftUI
import SafariServices
#if os(iOS)
struct SafariBrowser: UIViewControllerRepresentable {
    @Binding var disable: Bool
    @Binding var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let config = SFSafariViewController.Configuration()
        config.barCollapsingEnabled = false
        let safari = SFSafariViewController(url: url, configuration: config)
        safari.delegate = context.coordinator
        safari.dismissButtonStyle = .close
        safari.preferredBarTintColor = UIColor(red: 81/255 , green: 91/255, blue: 119/255, alpha: 1.0)
        safari.preferredControlTintColor = .white
        return safari
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
    func makeCoordinator() -> SafariBrowserCoordinator {
        SafariBrowserCoordinator(disableCoordinator: $disable)
    }
}

class SafariBrowserCoordinator: NSObject, SFSafariViewControllerDelegate {
    @Binding var disableCoordinator: Bool
    
    init(disableCoordinator: Binding<Bool>) {
        self._disableCoordinator = disableCoordinator
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        disableCoordinator = true
    }
}
#endif
