//
//  CreateRecipeViewController.swift
//  ReciBeeProject
//
//  Created by Chee Kok Ban on 7/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit
import Firebase

class CreateRecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var newRecipeName: UITextField!
    @IBOutlet weak var ingredientSearchBar: UISearchBar!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var nextBtn: UIButton!
    
    var arrayOfIngredients : [IngredientList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self


        // Do any additional setup after loading the view.
        
//        createTestData()
         downloadDataFirebase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfIngredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient_cell") as! IngredientTableViewCell
        
        let ingredient = arrayOfIngredients[indexPath.row]
        
        cell.configureCell(ingredient: ingredient)
        
        return cell
    }
    
//    func createTestData(){
//        
//        let newIngredient = IngredientList(ingredientName: "FP Pure Cane Sugar(Fine)", ingredientType: "Sugar", ingredientImageURL: "")
//        
//        newIngredient.savetoFirebase()
//    }
    
    func downloadDataFirebase(){
        
        let databaseRef = FIRDatabase.database().reference()
        let ingredientRef = databaseRef.child("IngredientList")
        
        ingredientRef.observe(.childAdded, with: { (snapshot) in
            
            let result = snapshot.value as! [String:Any]
            let ingredientName = result["ingredientName"] as! String
            let ingredientType = result["ingredientType"] as! String
            let ingredientImageURL = result["ingredientImageURL"] as! String?
            
            let ingredientList = IngredientList(ingredientName: ingredientName, ingredientType: ingredientType, ingredientImageURL: ingredientImageURL!, ingredientId: snapshot.key)
            
            self.arrayOfIngredients.append(ingredientList)
        }
            )
        ingredientRef.observe(.childChanged, with: { (snapshot) in
            
            let ingredientId = snapshot.key
            
            let ingredientToUpdate = self.ingredientPost(ingredientId: ingredientId)!
            
            let result = snapshot.value as! [String: Any]
            
            let ingredientName = result["ingredientName"] as! String
            let ingredientImageURL = result["ingredientImageURL"] as! String
            let ingredientType = result["ingredientType"] as! String
            
        
            ingredientToUpdate.ingredientName = ingredientName
            ingredientToUpdate.ingredientImageURL = ingredientImageURL
            ingredientToUpdate.ingredientType = ingredientType
            
        })
        
        ingredientRef.observe(.value, with: { (snapshot) in
            
            self.ingredientTableView.reloadData()
            
        })



}
        
    func ingredientPost(ingredientId: String) -> IngredientList? {
        
        for post in arrayOfIngredients {
            
            if post.ingredientId == ingredientId {
                
                return post
            }
        }
            return nil
        }
}
