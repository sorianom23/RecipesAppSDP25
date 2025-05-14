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
