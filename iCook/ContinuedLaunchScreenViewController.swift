//
//  ContinuedLaunchScreenViewController.swift
//  iCook
//
//  Created by Max Goldberg on 3/28/18.
//  Copyright © 2018 Appidemix LLC. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ContinuedLaunchScreenViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Try and login user automatically
        GIDSignIn.sharedInstance().uiDelegate = self
        checkUserLogin()
    }

    
    func checkUserLogin() {
        if let loginMethod = UserDefaults.standard.value(forKey: "preferredLoginMethod") {
            switch (loginMethod as? String) {
            case "google"?:
                print("Signing user in via Google...")
                GIDSignIn.sharedInstance().signInSilently()
            case "facebook"?:
                print("Signing user in via Facebook...")
            case "twitter"?:
                print("Signing user in via Twitter...")
            default:
                print("Login Error")
            }
        }
        else {
            print("User has no preferred login method.")
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "loginVCSegue", sender: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
