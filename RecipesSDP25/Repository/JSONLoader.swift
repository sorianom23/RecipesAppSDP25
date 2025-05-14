//
//  JSONLoader.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 14/5/25.
//

import Foundation

protocol JSONLoader {}

extension JSONLoader {
    func load<T: Codable>(from url: URL, as type: T.Type) throws -> T {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }

    func save<T: Codable>(to url: URL, data: T) throws {
        let jsonData = try JSONEncoder().encode(data)
        try jsonData.write(to: url, options: [.atomic, .completeFileProtection])
    }
}

