//
//  AppDelegate.swift
//  Moments_swift
//
//  Created by Alex Danner on 4/27/17.
//  Copyright © 2017 Alex Danner. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FIRApp.configure()
        
//        let dummyUser = User(uid: "123", username: "myusername", fullName: "My Dummy User", bio: "My Dummy User", website: "My Dummy User", profileImage: UIImage(named: "1"), follows: [], followedBy: [])
        
//        dummyUser.save { (error) in
//            print(error!)
//        }
        
        return true
    }
}

