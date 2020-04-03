//
//  MenageData.swift
//  PhotoAlbum
//
//  Created by Petro Onishchuk on 3/28/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation
import SwiftUI

class MenageData {
    
    static func loadPictures(pathName: String) -> [Picture] {
        
         let filename = getDocumentsDirectory().appendingPathComponent(pathName)
        
       do {
            let data = try Data(contentsOf: filename)
          let pictures = try JSONDecoder().decode([Picture].self, from: data)
        return pictures
            
        } catch {
            print("Unable to load saved data")
        }
        return []
        
    }
    
    static func savedPictures(pathName: String, pictures: [Picture]) {
        let filename = getDocumentsDirectory().appendingPathComponent(pathName)
        
        do {
            let data = try JSONEncoder().encode(pictures)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    static func savesImage(pathName: String, inputImage: UIImage?) {
        
        let fileName = getDocumentsDirectory().appendingPathComponent(pathName)
        do {
            if let jpegData = inputImage?.jpegData(compressionQuality: 0.8) {
                try jpegData.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
            }
        } catch {
            print("Unable to save image")
        }
    }
    
    static func removeImage(pathName: String) {
        let fileName = self.getDocumentsDirectory().appendingPathComponent(pathName)
        do {
            try FileManager.default.removeItem(at: fileName)
        } catch {
            print("Unable to delete picture")
        }
    }
    
    
    static  func loadImage(pathName: String) -> Data? {
        let fileName = getDocumentsDirectory().appendingPathComponent(pathName)
        do {
            let data = try Data(contentsOf: fileName)
            return data
        } catch {
            print("Unable to load image")
        }
        return nil
    }
    
    static func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
}
