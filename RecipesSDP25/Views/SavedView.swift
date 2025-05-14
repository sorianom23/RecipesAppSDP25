

import SwiftUI

struct SavedView: View {
    @Environment(RecipeViewModel.self) private var viewModel

    var body: some View {
        NavigationStack {
            List(viewModel.savedRecipes) { recipe in
                NavigationLink(destination: DetailView(recipe: recipe)) {
                    Text(recipe.name)
                }
            }
            .navigationTitle("Saved Recipes")
        }
    }
}


#Preview {
    SavedView()
}
