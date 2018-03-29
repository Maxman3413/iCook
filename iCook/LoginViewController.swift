//
//  LoginViewController.swift
//  iCook
//
//  Created by Max Goldberg on 3/27/18.
//  Copyright © 2018 Appidemix LLC. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {

    var googleCredential: AuthCredential?
    var preferredLoginMethod: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func twitterLogin(_ sender: UIButton) {
        
    }
    
    @IBAction func googleLogin(_ sender: UIButton) {
        // Sign in user via Google
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func facebookLogin(_ sender: UIButton) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
