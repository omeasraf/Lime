//
//  Ingredient.swift
//  Ingredient
//
//  Created by Ome Asraf on 8/12/21.
//

import Foundation

enum IngredientUnit: String {
    case cup = "Cup"
    case tablespoon = "Tablespoon"
    case teaspoon = "Teaspoon"
    case pinch = "Pinch"
    case dash = "Dash"
    case lb = "lb"
    case kg = "kg"
    case mg = "mg"
    case g = "g"
    case ml = "ml"
    case L = "L"
    case whole = "Whole"
}
struct Ingredient: Identifiable {
    var id = UUID()
    var name: String
    var amount: Double
    var amountUnit: IngredientUnit
    var orderNumber: Int
}
