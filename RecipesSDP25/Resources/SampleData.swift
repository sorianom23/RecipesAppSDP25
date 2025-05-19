//
//  SampleData.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 19/5/25.
//
import SwiftData
import SwiftUI

struct SampleData: PreviewModifier {
    static func makeSharedContext() async throws -> ModelContainer {
        let schema = Schema([Item.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])

        let sampleItems = [
            Item(name: "Pan"),
            Item(name: "Leche", isCompleted: true),
            Item(name: "Huevos"),
            Item(name: "Tomates"),
            Item(name: "Aceite de oliva")
        ]

        for item in sampleItems {
            container.mainContext.insert(item)
        }

        return container
    }

    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}



