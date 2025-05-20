//
//  SampleData.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 20/5/25.
//
import SwiftData
import SwiftUI

struct SampleData: PreviewModifier {
    
    static func makeSharedContext() async throws -> ModelContainer { // vamos a devolver un ModelContainer de prueba
        
        let schema = Schema([Item.self]) // tabla
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true) // true porq no almacena en la base de datos
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
    } // la vista y el contexto de la propia vista y se añade a la vista
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData()) // para que vaya sobre el hilo principal y no tengamos problemas de concurrencia @MainActor
}
