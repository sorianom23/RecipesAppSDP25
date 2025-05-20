//
//  RecipesSDP25App.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 14/5/25.
//
import SwiftUI
import SwiftData

@main
struct RecipesSDP25App: App {

    @State private var viewModel = RecipeViewModel()
    
    var sharedModelContainer: ModelContainer {
        let schema = Schema([Item.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: modelConfiguration)
        } catch {
            fatalError("No se pudo crear el ModelContainer: \(error)")
        }
        
    }

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(viewModel)
                .environment(ShoppingListViewModel(context: sharedModelContainer.mainContext))
                .modelContainer(sharedModelContainer)
        }
    }
}
