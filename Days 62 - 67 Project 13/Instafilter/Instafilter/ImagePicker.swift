//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Petro Onishchuk on 3/7/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    //typealias UIViewControllerType = UIImagePickerController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        //code
        
    }
}
