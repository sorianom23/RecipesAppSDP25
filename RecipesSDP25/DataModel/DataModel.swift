//
//  DataModel.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 14/5/25.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String?
    let difficulty: String?
    let servings: Int
    let prepTimeMinutes: Int?
    let cookTimeMinutes: Int?
    let caloriesPerServing: Int?
    let image: String
    let ingredients: [String]
    let instructions: [String]
    let rating: Double?
    let cuisine: String?
    let tags: [String]?
}

struct RecipeList: Codable {
    let recipes: [Recipe]
    let total: Int
    //let skip: Int
    //let limit: Int
}


extension Recipe {
    static let preview = Recipe(
        id: 1,
        name: "Spaghetti Bolognese",
        description: "Classic Italian pasta dish with meat sauce.",
        difficulty: "Easy",
        servings: 4,
        prepTimeMinutes: 15,
        cookTimeMinutes: 30,
        caloriesPerServing: 550,
        image: "https://example.com/spaghetti.jpg",
        ingredients: ["Spaghetti", "Tomato", "Beef", "Garlic", "Onion"],
        instructions: ["Boil pasta", "Cook sauce", "Mix together"],
        rating: 4.5,
        cuisine: "Italian",
        tags: ["pasta", "dinner"]
    )
}
