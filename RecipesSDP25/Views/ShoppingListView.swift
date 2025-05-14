
import SwiftUI

struct ShoppingListView: View {
    
    @Environment(ShoppingListViewModel.self) private var viewModel: ShoppingListViewModel

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Add item...", text: Binding(
                        get: { viewModel.newItem },
                        set: { viewModel.newItem = $0 }
                    ))
                    .textFieldStyle(.roundedBorder)

                    Button(action: viewModel.addItem) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                    .disabled(viewModel.newItem.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding()

                List {
                    ForEach(viewModel.items) { item in
                        HStack {
                            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(item.isCompleted ? .green : .gray)
                                .onTapGesture {
                                    viewModel.toggleCompletion(for: item)
                                }

                            Text(item.name)
                                .strikethrough(item.isCompleted)
                                .foregroundColor(item.isCompleted ? .gray : .primary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("🛒 Shopping list")
        }
    }
}


#Preview("Shopping List") {
    ShoppingListView()
        .environment(ShoppingListViewModel())
}

