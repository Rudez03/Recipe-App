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
	
//    init(name: String, description: String, ingredients: [String], prepTime: String) {
//		self.name = name
//		self.description = description
//		self.ingredients = ingredients
//		self.prepTime = prepTime
//	}
}
