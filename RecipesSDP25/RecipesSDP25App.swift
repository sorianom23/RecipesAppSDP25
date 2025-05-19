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

    let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: Item.self)
        } catch {
            fatalError("No se pudo crear ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(viewModel)
                .environment(ShoppingListViewModel(context: container.mainContext))
                .modelContainer(container)
        }
    }
}
