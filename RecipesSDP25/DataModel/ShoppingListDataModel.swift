//
//  ShoppingListDataModel.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 19/5/25.
//
import SwiftData
import Foundation

@Model
final class Item {
    var id: UUID
    var name: String
    var isCompleted: Bool

    init(id: UUID = UUID(), name: String, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }
}

