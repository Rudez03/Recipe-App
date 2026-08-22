//
//  DraftRecipe.swift
//  Recipe App
//
//  Created by Chacho on 8/22/26.
//

import Foundation

struct DraftRecipe {
    var name: String
    var descrip: String
    //var ingredients: [String]
    var instructions: String
    var hours: Int
    var mins: Int
    var servings: Int?
    
    
    init(from recipe: Recipe) {
        self.name = recipe.name
        self.descrip = recipe.descrip
        self.instructions = recipe.instructions
        self.hours = recipe.totalMins / 60
        self.mins = recipe.totalMins % 60
        self.servings = recipe.servings
    }
}
