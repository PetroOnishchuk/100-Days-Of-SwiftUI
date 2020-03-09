//
//  InstafilterImagePicker.swift
//  Instafilter
//
//  Created by Petro Onishchuk on 3/9/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation
import SwiftUI
struct InstafilterImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    

    func makeUIViewController(context: UIViewControllerRepresentableContext<InstafilterImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<InstafilterImagePicker>) {
        
    }
    
    
}
