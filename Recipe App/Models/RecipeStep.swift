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
    var step: Int
	var name: String
	var details: String
	
	var recipe: Recipe? = nil
	
	init(step: Int, name: String, details: String = "") {
        self.step = step
		self.name = name
		self.details = details
	}
	
}
