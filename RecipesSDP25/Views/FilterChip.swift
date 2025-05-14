

import SwiftUI

struct FilterChip: View {
    var label: String
    var color: Color
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Text(label)
                    .font(.subheadline)
                    .bold()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? color.opacity(0.2) : Color(.systemGray6))
            .foregroundColor(isSelected ? color : .primary)
            .clipShape(Capsule())
        }
    }
}


#Preview("Recipe Filters", traits: .sizeThatFitsLayout) {
    struct PreviewWrapper: View {
        @State var selectedCuisine = "🌏 All"
        @State var selectedDifficulty = "Select difficulty"

        var body: some View {
            RecipeFilterBarView(
                selectedCuisine: $selectedCuisine,
                selectedDifficulty: $selectedDifficulty
            )
            .padding()
        }
    }

    return PreviewWrapper()
}
