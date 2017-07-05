//
//  NewsfeedTableTableViewController.swift
//  Moments_swift
//
//  Created by Alex Danner on 5/4/17.
//  Copyright © 2017 Alex Danner. All rights reserved.
//

import UIKit
import Firebase

class NewsfeedTableTableViewController: UITableViewController {

    struct Storyboard {
        static let showWelcome = "ShowWelcomeViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if the user is logged in or not
        FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
            if let user = user {
                //signed in
            } else {
                self.performSegue(withIdentifier: Storyboard.showWelcome, sender: nil)
            }
        })
    }
}
