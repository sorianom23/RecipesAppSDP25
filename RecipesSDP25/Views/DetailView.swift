

import SwiftUI

struct DetailView: View {
    
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let url = URL(string: recipe.image) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 4)
                    } placeholder: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(Color(.systemGray6))
                                .frame(height: 250)
                                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)

                            Image(systemName: "hourglass")
                                .font(.system(size: 30))
                                .foregroundColor(.gray.opacity(0.6))
                        }
                    }
                    .padding()
                }
            }


                VStack(alignment: .leading, spacing: 8) {
                    Text(recipe.name)
                        .font(.title)
                        .bold()

                    if let rating = recipe.rating {
                        Text("⭐️ \(rating, specifier: "%.1f")")
                            .font(.headline)
                    }

                    if let description = recipe.description {
                        Text(description)
                            .font(.body)
                    }

                    Text("🍽️ **\(recipe.servings) people**")

                    if let prep = recipe.prepTimeMinutes {
                        Text("⏱️ **Prep:** \(prep) min")
                    }

                    if let calories = recipe.caloriesPerServing {
                        Text("🔥 **\(calories) cal/portion**")
                    }

                    Divider()
                    Text("Ingredients")
                        .font(.headline)
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("• \(ingredient)")
                    }

                    Divider()
                    Text("Instructions")
                        .font(.headline)
                    ForEach(recipe.instructions.indices, id: \.self) { i in
                        Text("\(i + 1). \(recipe.instructions[i])")
                    }
                }
                .padding(.horizontal)
            }
        }
    }



#Preview("DetailView") {
    NavigationStack {
        DetailView(recipe: Recipe(
            id: 1,
            name: "Classic Margherita Pizza",
            description: "A delicious homemade margherita pizza with fresh mozzarella and basil.",
            difficulty: "Easy",
            servings: 2,
            prepTimeMinutes: 15,
            cookTimeMinutes: 20,
            caloriesPerServing: 450,
            image: "https://www.example.com/pizza.jpg",
            ingredients: [
                "1 pizza dough",
                "1/2 cup tomato sauce",
                "100g mozzarella",
                "Fresh basil",
                "Olive oil"
            ],
            instructions: [
                "Preheat oven to 220°C.",
                "Roll out the dough and spread tomato sauce.",
                "Add mozzarella and basil.",
                "Drizzle with olive oil.",
                "Bake for 12-15 minutes until crust is golden."
            ],
            rating: 4.8,
            cuisine: "Italian",
            tags: ["vegetarian", "dinner"]
        ))
    }
}

