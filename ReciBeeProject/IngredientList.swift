//
//  IngredientList.swift
//  ReciBeeProject
//
//  Created by Chee Kok Ban on 7/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import Foundation

class IngredientList {
    
    var ingredientName: String
    var ingredientType: String
    var ingredientImageURL: String //image can be from honestbee
    
    init(ingredientName: String,ingredientType: String, ingredientImageURL: String) {
        
        self.ingredientName = ingredientName
        self.ingredientType = ingredientType
        self.ingredientImageURL = ingredientImageURL
        
        
    }
    
    
    
    
}
