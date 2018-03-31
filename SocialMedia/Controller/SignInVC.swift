//
//  SignInVC.swift
//  SocialMedia
//
//  Created by Vy Le on 3/25/18.
//  Copyright © 2018 Vy Le. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: RoundedTextField!
    @IBOutlet weak var passwordTextField: RoundedTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.defaultKeychainWrapper.string(forKey: KEY_UID){
            print("***** ID found in keychain")
            performSegue(withIdentifier: "FeedVCSegue", sender: nil)
        }
    }

    @IBAction func facebookButtonTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self, handler: { (result, error) in
            if error != nil {
                print("***** Unable to authenticate with FB - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("***** User cancelled FB authentication")
            } else {
                print("***** Successfully authenticated with FB")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
            
        })
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: {(user, error) in
            if error != nil {
                print("***** Unable to authenticate with Firebase - \(String(describing: error))")
            } else {
                print("***** Successfull authenticated with Firebase")
                if let user = user {
                    let userData = ["provider": credential.provider]
                    self.completeSignIn(id: user.uid, userData: userData)
                }
            }
        })
    }
    
    // TODO: Fix signIn and signUp.
    @IBAction func SignInTapped(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("***** Email user authenticated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                    
                } else {
                    print("***** Email has not sign up yet")
                    //TODO: Pop up notification
                }
                
                
//                } else {
//                    Auth.auth().createUser(withEmail: email, password: password, completion: {(user, error) in
//
//                        if error != nil {
//                            print("***** Unable to authenticate with Firebase email")
//                        } else {
//                            print("***** Successfully authenticate with Firebase")
//                        }
//
//                    })
//                }
            })
            
        }
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password, completion: {(user, error) in
                
                if error != nil {
                    print("***** Unable to authenticate with Firebase email")
                } else {
                    print("***** Successfully authenticate with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                }
                
            })
        }
        
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.defaultKeychainWrapper.set(id, forKey: KEY_UID)
        print("***** Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "FeedVCSegue", sender: nil)
    }
    
    

}
