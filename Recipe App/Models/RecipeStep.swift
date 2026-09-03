//
//  RecipeStep.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 9/2/26.
//

import Foundation
import SwiftData

@Model
class RecipeStep: Identifiable {
	var id: UUID = UUID()
	var name: String
	var details: String
	var step: Int
	
	var recipe: Recipe? = nil
	
	init(name: String, details: String = "", step: Int) {
		self.name = name
		self.details = details
		self.step = step
	}
	
}
