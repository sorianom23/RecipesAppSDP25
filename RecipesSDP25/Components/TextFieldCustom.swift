//
//  SwiftUIView.swift
//  RecipesSDP25
//
//  Created by Maria Soriano on 19/5/25.
//

import SwiftUI

struct TextFieldCustom: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(.gray.opacity(0.2))
            .clipShape(Capsule(style: .continuous))
    }
}

