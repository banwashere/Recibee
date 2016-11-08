//
//  IngredientList.swift
//  ReciBeeProject
//
//  Created by Chee Kok Ban on 7/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import Foundation
import Firebase

class IngredientList {
    
    var ingredientId: String?
    var ingredientName: String
    var ingredientType: String
    var ingredientImageURL: String //image can be from honestbee
    
    init(ingredientName: String,ingredientType: String, ingredientImageURL: String, ingredientId: String?) {
        
        self.ingredientName = ingredientName
        self.ingredientType = ingredientType
        self.ingredientImageURL = ingredientImageURL
        
        if let ingredientId = ingredientId{
            
            self.ingredientId = ingredientId
        
        }
    }
    
    func savetoFirebase(){
        
        let databaseRef = FIRDatabase.database().reference()
        let postRef = databaseRef.child("IngredientList")
        
        //let firebase to create unique ID
        let newIngredient = postRef.childByAutoId()
        
        //create empty dict
        var parameter : [String:Any] = [:]
        
        parameter["ingredientName"] = ingredientName
        parameter["ingredientImageURL"] = ingredientImageURL
        parameter["ingredientType"] = ingredientType
        
        //save to server
        newIngredient.setValue(parameter) { (error, ref) in
            if error != nil{
                print("error saving")
            }
        }
        
    }
    
    
    
    
}
