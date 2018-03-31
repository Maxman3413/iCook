//
//  Recipe.swift
//  iCook
//
//  Created by Max Goldberg on 3/30/18.
//  Copyright © 2018 Appidemix LLC. All rights reserved.
//

import Foundation
import UIKit


struct Recipe {
    var title = ""
    var ingredients = [String]()
    var imageURL = ""
    var recipeURL = ""
    var recipeReferenceLink = ""
    
    init(title: String, ingredients: Array<String>, imageURL: String, recipeURL: String, recipeReferenceLink: String) {
        self.title = title
        self.ingredients = ingredients
        self.imageURL = imageURL
        self.recipeURL = recipeURL
        self.recipeReferenceLink = recipeReferenceLink
    }
}
