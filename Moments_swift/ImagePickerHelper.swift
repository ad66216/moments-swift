//
//  ImagePickerHelper.swift
//  Moments_swift
//
//  Created by Alex Danner on 5/4/17.
//  Copyright © 2017 Alex Danner. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

typealias ImagePickerHelperCompletion = ((UIImage) -> Void)!

class imagePickerHelper: NSObject
{
    //action sheet, imagePickerController ==> viewcontroller
    weak var viewController: UIViewController!
    var completion: ImagePickerHelperCompletion
    
    init(viewController: UIViewController, completion: ImagePickerHelperCompletion) {
        self.viewController = viewController
        self.completion = completion
        
        super.init()
        
        self.showPhotoSourceSelection()
    }
    func showPhotoSourceSelection()
    {
        let actionSheet = UIAlertController(title: "Pick New Photo", message: "Would you like to open photos library or camera?", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
            self.showImagePicker(sourceType: .camera)
        }
        let photosLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
            self.showImagePicker(sourceType: .photoLibrary)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
        }
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photosLibraryAction)
        actionSheet.addAction(cancelAction)
        
        viewController.present(actionSheet, animated: true, completion: nil)
    }
    func showImagePicker(sourceType: UIImagePickerControllerSourceType)
    {
        //we create the image picker here and define some of its properties
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = sourceType
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.delegate = self
        
        viewController.present(imagePicker, animated: true, completion: nil)
    }
}

extension imagePickerHelper : UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        viewController.dismiss(animated: true, completion: nil)
        completion(image)
    }
}




























