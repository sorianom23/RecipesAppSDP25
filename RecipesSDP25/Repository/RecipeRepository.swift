//
//  RecipeRepository.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 14/5/25.
//

import Foundation

struct RecipeRepository: RecipeDataRepository {}

protocol RecipeDataRepository: JSONLoader, Sendable {
    var bundleURL: URL { get }
    var documentURL: URL { get }

    func getRecipes() throws -> [Recipe]
    func saveRecipes(_ recipes: [Recipe]) throws
}

extension RecipeDataRepository {

    var bundleURL: URL {
        Bundle.main.url(forResource: "recipes_flat", withExtension: "json")!
    }

    var documentURL: URL {
        URL.documentsDirectory
            .appending(path: "recipes_flat")
            .appendingPathExtension(for: .json)
    }

    func getRecipes() throws -> [Recipe] {
        if FileManager.default.fileExists(atPath: documentURL.path()) {
            return try load(from: documentURL, as: [Recipe].self)
        } else {
            return try load(from: bundleURL, as: [Recipe].self)
        }
    }

    func saveRecipes(_ recipes: [Recipe]) throws {
        try save(to: documentURL, data: recipes)
    }
}

