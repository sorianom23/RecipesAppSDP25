//
//  ShoppingListViewModel.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 14/5/25.
//
import Foundation
import Observation

struct ShoppingItem: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var isCompleted: Bool = false
}


@Observable
class ShoppingListViewModel {
    var items: [ShoppingItem] = [
        ShoppingItem(name: "Tomates"),
        ShoppingItem(name: "Mozzarella"),
        ShoppingItem(name: "Albahaca"),
        ShoppingItem(name: "Aceite de oliva")
    ]
    
    var newItem: String = ""
    
    func addItem() {
        let trimmed = newItem.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        items.append(ShoppingItem(name: trimmed))
        newItem = ""
    }

    func toggleCompletion(for item: ShoppingItem) {
        if let index = items.firstIndex(of: item) {
            items[index].isCompleted.toggle()
        }
    }
}
