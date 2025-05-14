//
//  ContentView.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 14/5/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(RecipeViewModel.self) private var viewModel

    var body: some View {
        TabView {
            Tab("Recipes", systemImage: "list.bullet") {
                    RecipeListView()
            }

            Tab("Saved", systemImage: "bookmark.fill") {
                    SavedView()
            }

            Tab("Shopping List", systemImage: "cart.fill") {
                    ShoppingListView()
            }

            Tab("Timer", systemImage: "timer") {
                    TimerView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(RecipeViewModel())
}

