import SwiftUI
import SwiftData

struct ShoppingListView: View {

    @Environment(\.modelContext) private var context
    @Query private var items: [Item]
    @State private var viewModel: ShoppingListViewModel

    init() {
        _viewModel = State(initialValue: ShoppingListViewModel(context: nil))
    }

    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Add item...", text: $viewModel.newItem)
                        .textFieldStyle(TextFieldCustom())

                    Button(action: viewModel.addItem) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                    .disabled(viewModel.newItem.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding()

                List {
                    ForEach(items) { item in
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
                    .onDelete { indexSet in
                        let toDelete = indexSet.map { items[$0] }
                        viewModel.deleteItems(toDelete)
                    }
                }
            }
            .navigationTitle("🛒 Shopping list")
        }
        .onAppear {
            viewModel.context = context
        }
    }
}



#Preview("Shopping List", traits: .sampleData) {
    ShoppingListView()
}
