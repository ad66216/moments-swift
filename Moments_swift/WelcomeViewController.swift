//
//  WelcomeViewController.swift
//  
//
//  Created by Alex Danner on 5/4/17.
//
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRAuth.auth()?.addStateDidChangeListener({ (euth, user) in
            if let user = user {
                self.dismiss(animated: false, completion: nil)
            } else {
                
            }
        })
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
