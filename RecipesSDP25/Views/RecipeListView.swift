

import SwiftUI

struct RecipeListView: View {
    
    @Environment(RecipeViewModel.self) private var viewModel

    @State private var selectedCuisine: String = "All"
    @State private var selectedDifficulty: String = "All"

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                RecipeFilterBarView(
                    selectedCuisine: $selectedCuisine,
                    selectedDifficulty: $selectedDifficulty
                )

                List(viewModel.filteredRecipes(
                    cuisine: selectedCuisine,
                    difficulty: selectedDifficulty
                )) { recipe in
                    NavigationLink(destination: DetailView(recipe: recipe)) {
                        HStack(alignment: .top) {
                            if let url = URL(string: recipe.image) {
                                AsyncImage(url: url) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray.opacity(0.3)
                                }
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(recipe.name)
                                        .font(.headline)

                                    if viewModel.isFavorite(recipe) {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.red)
                                    }
                                    if viewModel.isSaved(recipe) {
                                        Image(systemName: "bookmark.fill")
                                            .foregroundColor(.blue)
                                    }
                                }

                                Text("⏱️ \((recipe.prepTimeMinutes ?? 0) + (recipe.cookTimeMinutes ?? 0)) min | 🍽️ \(recipe.servings) portions")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            viewModel.toggleFavorite(recipe)
                        } label: {
                            Label("Favorite", systemImage: "heart")
                        }
                        .tint(.red)

                        Button {
                            viewModel.toggleSaved(recipe)
                        } label: {
                            Label("Save", systemImage: "bookmark")
                        }
                        .tint(.blue)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Recipes")
            }
        }
    }
}


#Preview {
    RecipeListView()
        .environment(RecipeViewModel())
}
