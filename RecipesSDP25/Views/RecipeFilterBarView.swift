

import SwiftUI


struct CuisineOption: Identifiable {
    var id: String { value }
    let label: String
    let value: String
}

struct RecipeFilterBarView: View {
    
    @Binding var selectedCuisine: String
    @Binding var selectedDifficulty: String


    let cuisineOptions: [CuisineOption] = [
        .init(label: "🌍 All", value: "All"),
        .init(label: "🇮🇹 Italian", value: "Italian"),
        .init(label: "🇲🇽 Mexican", value: "Mexican"),
        .init(label: "🇮🇳 Indian", value: "Indian"),
        .init(label: "🇪🇸 Spanish", value: "Spanish")
    ]

    let difficulties = ["All", "Easy", "Medium", "Hard"]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(cuisineOptions) { option in
                        FilterChip(
                            label: option.label,
                            color: .blue,
                            isSelected: selectedCuisine == option.value
                        ) {
                            selectedCuisine = option.value
                        }
                    }
                }
                .padding(.horizontal)
            }


            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    Menu {
                        ForEach(difficulties, id: \.self) { level in
                            Button {
                                selectedDifficulty = level
                            } label: {
                                Text(level)
                            }
                        }
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "brain.head.profile")
                            Text(selectedDifficulty)
                                .font(.subheadline)
                                .bold()
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.purple.opacity(0.2))
                        .foregroundColor(.purple)
                        .clipShape(Capsule())
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.top, 8)
    }
}




#Preview("Recipe Filters", traits: .sizeThatFitsLayout) {
    struct PreviewWrapper: View {
        @State var selectedCuisine = "🌏 All"
        @State var selectedDifficulty = "Select difficulty"
        @State var maxPrepTime = 60

        var body: some View {
            RecipeFilterBarView(
                selectedCuisine: $selectedCuisine,
                selectedDifficulty: $selectedDifficulty,
            )
            .padding()
        }
    }

    return PreviewWrapper()
}
