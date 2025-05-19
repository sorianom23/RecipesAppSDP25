//
//  ViewModel.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 14/5/25.
//
import Foundation

enum SortOrder: String, CaseIterable, Identifiable {
    case defaultOrder = "Orden por defecto"
    case ascending = "Nombre ascendente"
    case descending = "Nombre descendente"
    
    var id: Self { self }
}

@Observable
class RecipeViewModel {
    private let repository: RecipeDataRepository
    
    var recipes: [Recipe] = [] {
        didSet {
            try? repository.saveRecipes(recipes)
        }
    }
    
    var search: String = ""
    var sortOrder: SortOrder = .defaultOrder
    var favoriteIDs: Set<Int> = []
    var savedIDs: Set<Int> = []
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    init(repository: RecipeDataRepository = RecipeRepository()) {
        self.repository = repository
        Task {
            await loadRecipes()
        }
    }
    
    func filteredRecipes(cuisine: String, difficulty: String, query: String) -> [Recipe] {
        recipes.filter { recipe in
            let cuisineOK = cuisine == "All" || recipe.cuisine == cuisine
            let difficultyOK = difficulty == "All" || recipe.difficulty == difficulty

            let queryOK = query.isEmpty ||
                recipe.name.localizedCaseInsensitiveContains(query) ||
                recipe.ingredients.joined(separator: " ").localizedCaseInsensitiveContains(query)

            return cuisineOK && difficultyOK && queryOK
        }
    }
    
    
    func loadRecipes() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let loaded = try repository.getRecipes()
            recipes = loaded
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    /*
     func toggleFavorite(_ recipe: Recipe) {
         if favoriteIDs.contains(recipe.id) {
             favoriteIDs.remove(recipe.id)
         } else {
             favoriteIDs.insert(recipe.id)
         }
     }

     */
    
    func toggleFavorite(_ recipe: Recipe) {
        favoriteIDs.formSymmetricDifference([recipe.id])
    }
    
    func toggleSaved(_ recipe: Recipe) {
        savedIDs.formSymmetricDifference([recipe.id])
    }
    
    func isFavorite(_ recipe: Recipe) -> Bool {
        favoriteIDs.contains(recipe.id)
    }
    
    func isSaved(_ recipe: Recipe) -> Bool {
        savedIDs.contains(recipe.id)
    }
    
    var favoritesCount: Int {
        favoriteIDs.count
    }
    
    var savedRecipes: [Recipe] {
        recipes.filter { savedIDs.contains($0.id) }
    }
    
    
    var visibleRecipes: [Recipe] {
        var filtered = recipes
        
        if !search.isEmpty {
            filtered = filtered.filter {
                $0.name.localizedCaseInsensitiveContains(search)
            }
        }
        
        switch sortOrder {
        case .ascending:
            filtered.sort { $0.name < $1.name }
        case .descending:
            filtered.sort { $0.name > $1.name }
        case .defaultOrder:
            break
        }
        
        return filtered
    }
}
