//
//  ViewController.swift
//  iCook
//
//  Created by Max Goldberg on 3/27/18.
//  Copyright © 2018 Appidemix LLC. All rights reserved.
//

import UIKit
import Firebase

class RecipesViewController: UITableViewController {
    
    let databaseRef = Database.database().reference()
    let storageRef = Storage.storage().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

