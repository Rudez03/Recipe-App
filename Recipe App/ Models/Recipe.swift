//
//  Recipe.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 3/25/26.
//

import Foundation

struct Recipe: Identifiable {
	let id = UUID()
	
	var name: String
	var description: String
	var ingredients: [Ingredient]
	var prepTime: String
    var servings: Int?
	
	var icon: String?
    // make a list of strings I think....
    var instructions: String?
    
}
