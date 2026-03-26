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
	var ingredients: [String]
	var prepTime: String
	
	var icon: String?
	
	init(name: String) {
		self.name = name
		self.description = ""
		self.ingredients = []
		self.prepTime = ""
	}
}
