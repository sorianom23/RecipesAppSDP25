//
//  RecipesSDP25App.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 14/5/25.
//
import SwiftUI

@main

struct RecipesSDP25App: App {
    
    @State private var viewModel = RecipeViewModel()

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(viewModel)
                .environment(ShoppingListViewModel())
        }
    }
}
