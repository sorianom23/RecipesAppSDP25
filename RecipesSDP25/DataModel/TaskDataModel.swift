//
//  SampleData.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 19/5/25.
//
import SwiftData
import SwiftUI

@Model
final class Items {
    @Attribute(.unique) var id: UUID
    var nombre: String
    
    init(id: UUID, nombre: String) {
        self.id = id
        self.nombre = nombre
    }
}



