//
//  ShoppingListViewModel.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 14/5/25.
//
import Foundation
import SwiftData

@Observable
class ShoppingListViewModel {
    var newItem: String = ""
    var context: ModelContext?

    init(context: ModelContext?) {
        self.context = context
    }

    func addItem() {
        let trimmed = newItem.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }

        let item = Item(name: trimmed)
        context?.insert(item)
        try? context?.save()

        newItem = ""
    }

    func toggleCompletion(for item: Item) {
        item.isCompleted.toggle()
        try? context?.save()
    }

    func deleteItems(_ items: [Item]) {
        for item in items {
            context?.delete(item)
        }
        try? context?.save()
    }
}
