//
//  Ingredients.swift
//  Recipe App
//
//  Created by Chacho on 6/30/26.
//

import Foundation


struct Ingredients: Identifiable {
    let id: UUID = UUID()
    
    let name: String
    let amount: String
    let unit: String
}
