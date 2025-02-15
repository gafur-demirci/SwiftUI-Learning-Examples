//
//  ImagePicker.swift
//  instaClone
//
//  Created by Abdulgafur Demirci on 15.02.2025.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var picture: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let mediaPicker = UIImagePickerController()
        mediaPicker.delegate = context.coordinator
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            mediaPicker.sourceType = .camera
//            mediaPicker.mediaTypes = ["public.image"]
//            mediaPicker.allowsEditing = false
//            mediaPicker.cameraCaptureMode = .photo
//        } else {
//            print("The media is not available")
//        }
        return mediaPicker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(self)
    }
}
class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let parent : ImagePicker
    
    init(_ parent : ImagePicker) {
        self.parent = parent
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let newpicture = info[.originalImage] as? UIImage {
            parent.picture = newpicture
        }
        parent.presentationMode.wrappedValue.dismiss()
    }
}
