//
//  IngredientConversion.swift
//  Recipe App
//
//  Created by Rudy Serrato III on 10/26/26.
//

import Foundation

struct IngredientConversion {
    
    private static let fractionSymbols: [String: String] = [
        "⅛": "1/8",
        "¼": "1/4",
        "⅓": "1/3",
        "½": "1/2",
        "⅔": "2/3",
        "¾": "3/4"
    ]
	static func parse(_ amount: String) -> Double? {
		var trimmedAmount = amount.trimmingCharacters(in: .whitespacesAndNewlines)
		for (symbol, fraction) in fractionSymbols {
			let replacement = trimmedAmount.replacingOccurrences(of: symbol, with: " " + fraction)
			trimmedAmount = replacement
		}
		trimmedAmount = trimmedAmount.trimmingCharacters(in: .whitespacesAndNewlines)
		let parts: [Substring]
		let whole: Double
		if let number = Double(trimmedAmount) {
			guard number.isFinite && number >= 0 else {
				return nil
				}
			return number
		}
		let mixed = trimmedAmount.split(separator: " ")
		guard mixed.count == 1 || mixed.count == 2 else {
			return nil
		}
		if mixed.count == 1 {
			parts = trimmedAmount.split(separator: "/", omittingEmptySubsequences: false)
			whole = 0
		} else {
			parts = mixed[1].split(separator: "/", omittingEmptySubsequences: false)
			guard let wholeNum = Double(mixed[0]), wholeNum >= 0, wholeNum.isFinite else {
				return nil
			}

			whole = wholeNum
		}

		guard parts.count == 2 else {
			return nil
		}
		guard let num = Double(parts[0]), num.isFinite, num >= 0 else {
			return nil
		}
		guard let den = Double(parts[1]), den > 0, den.isFinite else {
			return nil
		}

		let result = whole + (num/den)
		guard result.isFinite else {
			return nil
		}
		return result
	}
}
