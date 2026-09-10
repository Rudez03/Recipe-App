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
    var instructions: String
    var hours: Int
    var mins: Int
    var servings: Int?
    
    var ingredients: [DraftIngredient]
    var steps: [DraftRecipeStep]
    
    
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
        
		self.steps = recipe.steps.sorted{ $0.step < $1.step}.map { steps in
            DraftRecipeStep(from: steps)
        }
    }
}


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
    
    init(name: String = "") {
        self.id = UUID()
        self.name = name
        self.amount = ""
        self.unit = .none
        self.notes = ""
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

struct DraftRecipeStep: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var details: String
    var step: Int
    
    init(from recipeStep: RecipeStep) {
        self.id = recipeStep.id
        self.name = recipeStep.name
        self.details = recipeStep.details
        self.step = recipeStep.step
        
    }
    
    init(name: String, details: String = "", step: Int) {
        self.name = name
        self.details = details
        self.step = step
    }
}
