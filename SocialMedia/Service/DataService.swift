//
//  DataService.swift
//  SocialMedia
//
//  Created by Vy Le on 3/28/18.
//  Copyright © 2018 Vy Le. All rights reserved.
//

import Foundation
import Firebase
import SwiftKeychainWrapper

// Reference to the DATABASE_URL in GoogleService-Info.plist
let DB_BASE = Database.database().reference()
let STORAGE_BASE = Storage.storage().reference()

class DataService {
    
    static let ds = DataService()
    
    // Database references
    private var _refBase = DB_BASE
    private var _refPosts = DB_BASE.child("posts")
    private var _refUsers = DB_BASE.child("users")
    
    //Storage references
    private var _refPostImages = STORAGE_BASE.child("post-pics")
    
    
    var refBase: DatabaseReference {
        return _refBase
    }
    
    var refPosts: DatabaseReference {
        return _refPosts
    }
    
    var refUsers: DatabaseReference {
        return _refUsers
    }
    
    var refPostImages: StorageReference {
        return _refPostImages
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        refUsers.child(uid).updateChildValues(userData)
    }
    
    
}
