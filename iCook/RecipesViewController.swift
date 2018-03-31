//
//  ViewController.swift
//  iCook
//
//  Created by Max Goldberg on 3/27/18.
//  Copyright © 2018 Appidemix LLC. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class RecipesViewController: UITableViewController {
    
    var recipes = [Recipe]()
    let databaseRef = Database.database().reference()
    let storageRef = Storage.storage().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getAPIRecipes(foodType: "blueberry") {
            print(self.recipes)
            self.tableView.reloadData()
        }
    }
    
    func getAPIRecipes(foodType: String, completion: @escaping () -> Void) {
        Alamofire.request("https://api.edamam.com/search?q=\(foodType)&app_id=925e2f92&app_key=c446cdc924a8dddadf768d395dfff646").responseJSON { response in
            if let json = response.result.value {
                let data = json as! [String : Any]
                let hits = data["hits"] as! [Dictionary<String, Any>]
                for hit in hits {
                    let recipe = hit["recipe"] as! [String : Any]
                    
                    let title = recipe["label"] as! String
                    let ingredients = recipe["ingredientLines"] as! Array<String>
                    let imageURL = recipe["image"] as! String
                    let recipeURL = recipe["url"] as! String
                    let recipeReferenceLink = recipe["uri"] as! String
                    
                    let newRecipe = Recipe(title: title, ingredients: ingredients, imageURL: imageURL, recipeURL: recipeURL, recipeReferenceLink: recipeReferenceLink)
                    self.recipes.append(newRecipe)
                }
                completion()
            } else {
                print("Something went wrong with the API")
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Recipe: \(recipes[indexPath.row].title)")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeTableViewCell") as! RecipeTableViewCell
        
        // Recipe Image
        var recipeImageData: Data?
        do {
            recipeImageData = try Data(contentsOf: URL(string: recipes[indexPath.row].imageURL)!)
        } catch {
            print("Error getting recipe image")
        }
        
        if recipeImageData != nil {
            cell.recipeImage.image = UIImage(data: recipeImageData!)!
            cell.recipeImage.contentMode = .scaleAspectFill
        } else {
            print("No recipe image to show!")
        }
        
        // Recipe Link
        cell.recipeLink = recipes[indexPath.row].recipeURL
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

