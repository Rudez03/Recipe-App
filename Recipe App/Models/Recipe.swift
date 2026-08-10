//
//  Recipe.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 3/25/26.
//

import Foundation
import SwiftData

@Model
class Recipe: Identifiable {
    
    // MARK: - Identity
	var id = UUID()
	
    // MARK: - Reicpe Data
	var name: String
	var descrip: String
    var ingredients: [Ingredient]
	var prepTime: String
    var totalMins: Int
    var servings: Int?
    var icon: String?
    // make a list of strings I think....
    var instructions: String
	
	init(name: String, descrip: String = "", ingredients: [Ingredient] = [], prepTime: String = "", totalMins: Int = 0, servings: Int? = nil, icon: String? = nil, instructions: String = "") {
		self.name = name
		self.descrip = descrip
		self.ingredients = ingredients
		self.prepTime = prepTime
		self.totalMins = totalMins
		self.servings = servings
		self.icon = icon
		self.instructions = instructions
		
	}
	
	
    
    // MARK: - Computed Properties
    var displayTime: String {
        if totalMins == 0 {
            return "N/A"
        }
        else {
            let hours = totalMins/60
            let rMins = totalMins%60
            
            if hours == 0 {
                return "\(rMins) mins"
            }
            else if rMins != 0 {
                return "\(hours) hrs \(rMins) mins"
            }
			else {
				return "\(hours) hrs"
			}
           
        }
    }
    
    
    
    
    
   
    
 
    
}
