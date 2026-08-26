//
//  DraftRecipe.swift
//  Recipe App
//
//  Created by Chacho on 8/22/26.
//

import Foundation


struct DraftIngredient: Identifiable {
    
    var id: UUID
    var name: String
    var amount: String
    var unit: IngredientUnit
    var notes: String
    
    init(from ingredient: Ingredient) {
        self.id = ingredient.id
        self.name = ingredient.name
        self.amount = ingredient.amount
        self.unit = ingredient.unit
        self.notes = ingredient.notes
    }
    
    var hasNotes: Bool {
        notes != ""
    }
    
    var displayText: String {
        if amount.isEmpty != true  {
            if unit != .none{
                return "\(amount) \(unit.displayName) \(name)"
            }
            else {
                return "\(amount) \(name)"
            }
        }
        else {
            return "\(name)"
        }
        
    }
}

struct DraftRecipe {
    var name: String
    var descrip: String
    //var ingredients: [String]
    var instructions: String
    var hours: Int
    var mins: Int
    var servings: Int?
    
    var ingredients: [DraftIngredient]
    
    
    init(from recipe: Recipe) {
        self.name = recipe.name
        self.descrip = recipe.descrip
        self.instructions = recipe.instructions
        self.hours = recipe.totalMins / 60
        self.mins = recipe.totalMins % 60
        self.servings = recipe.servings
        self.ingredients = recipe.ingredients.map { ingredient in
            DraftIngredient(from: ingredient)
        }
    }
}
