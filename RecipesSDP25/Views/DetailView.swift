

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
                            //.clipped()
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
    DetailView(recipe: .preview)
}

