//
//  SignupTableViewController.swift
//  
//
//  Created by Alex Danner on 5/4/17.
//
//

import UIKit

class SignupTableViewController: UITableViewController
{
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var imagePickerHelper: imagePickerHelper!
    
    @IBAction func createNewAccountDidTap() {
        // create a new user
        // save the user data, take a photo
        // login the user
        
    }
    @IBAction func backDidTap(_ sender: Any) {
    }
    
    @IBAction func changeProfilePhotoDidTap(_ sender: Any) {
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Choose Photo", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("File Deleted")
        })
        let saveAction = UIAlertAction(title: "Take Photo", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("File Saved")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
