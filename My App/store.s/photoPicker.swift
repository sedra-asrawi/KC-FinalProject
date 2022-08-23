////
////  photoPicker.swift
////  store.s
////
////  Created by Sedra Asrawi on 23/08/2022.
////
//
//import SwiftUI
//
//struct PhotoPicker: UIViewControllerRepresentable {
//
//    @Binding var logo: UIImage
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        picker.allowsEditing = true
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
//    
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(photoPicker: self)
//    }
//
//    final class Coordintor: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//
//        let photoPicker: PhotoPicker
//
//        init(photoPicker: PhotoPicker) {
//           self.photoPicker = photoPicker
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let image = info [.editedImage] as? UIImage {
//                photoPicker.logo = image
//            } else {
//
//            }
//            picker.dismiss(animated: true)
//        }
//    }
//}
//
