//
//  RecipeTableViewCell.swift
//  iCook
//
//  Created by Max Goldberg on 3/30/18.
//  Copyright © 2018 Appidemix LLC. All rights reserved.
//

import Foundation
import UIKit


class RecipeTableViewCell: UITableViewCell {
    
    var recipeLink: String?
    @IBOutlet weak var recipeImage: UIImageView!
    @IBAction func goToRecipe(_ sender: UIButton) {
        if recipeLink != nil {
            goToRecipeWith(link: recipeLink!)
        } else {
            print("Can't go to original recipe link")
        }
    }
    
    func goToRecipeWith(link: String) {
        let link = URL(string: link)
        UIApplication.shared.open(link!, options: [:], completionHandler: nil)
    }
}
