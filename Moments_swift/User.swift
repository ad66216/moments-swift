//
//  User.swift
//  Moments_swift
//
//  Created by Alex Danner on 4/28/17.
//  Copyright © 2017 Alex Danner. All rights reserved.
//

import Foundation
import Firebase

class User
{
    let uid: String
    var username: String
    var fullName: String
    var bio: String
    var website: String
    var profileImage: UIImage?
    
    var follows: [User]
    var followedBy: [User]
    
    // MARK: - Initializers
    
    init(uid: String, username: String, fullName: String, bio: String, website: String, profileImage: UIImage?, follows: [User], followedBy: [User])
    {
        self.uid = uid
        self.username = username
        self.fullName = fullName
        self.bio = bio
        self.website = website
        self.profileImage = profileImage
        self.follows = follows
        self.followedBy = followedBy
    }
    
    init(dictionary: [String : Any]) {
        uid = dictionary["uid"] as! String
        username = dictionary["username"] as! String
        fullName = dictionary["fullName"] as! String
        bio = dictionary["bio"] as! String
        website = dictionary["website"] as! String
        
        //follows
        self.follows = []
        if let followsDict = dictionary["follows"] as? [String : Any]  //Checks to see if there is "follows" in dictionary.  This is assigned to followsDict, a new variable we create.  The if statement checks to see if followsDict, which is assigned to the "follows" in the dictionary, is null or not.  If it is null, nothing happens, else it enters the block.
        {
            for (_, userDict) in followsDict
            {
                if let userDict = userDict as? [String : Any]
                {
                    self.follows.append(User(dictionary: userDict))
                }
            }
        }
        
        //followed by
        self.followedBy = []
        if let followedByDict = dictionary["followedBy"] as? [String : Any]
        {
            for (_, userDict) in followedByDict
            {
                if let userDict = userDict as? [String : Any]
                {
                    self.followedBy.append(User(dictionary: userDict))
                }
            }
        }
    }
    
    func save(completion: @escaping (Error?) -> Void)
    {
        // 1
        let ref = DatabaseReference.users(uid: uid).reference()
        ref.setValue(toDictionary())
        
        // 2 - save follows
        for user in follows {
            ref.child("follows/\(user.uid)").setValue(user.toDictionary())
        }
        
        // 3 - save followed by
        for user in followedBy {
            ref.child("followedBy/\(user.uid)").setValue(user.toDictionary())
        }
        
        // 4 - save the profile image
        if let profileImage = self.profileImage {
            
            let firImage = FIRImage(image: profileImage)
            
            firImage.saveProfileImage(self.uid, { (error) in
                completion(error)
            })
        }
    }
    
    func toDictionary() -> [String : Any] {
        return [
            "uid" : uid,
            "username" : username,
            "fullName" : fullName,
            "bio" : bio,
            "website" : website
        ]
    }
}
























