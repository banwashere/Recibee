//
//  IngredientTableViewCell.swift
//  ReciBeeProject
//
//  Created by Chee Kok Ban on 7/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientName: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    }
    
    func configureCell(ingredient: IngredientList){
        
        self.ingredientName.text = ingredient.ingredientName
        

    }

}
