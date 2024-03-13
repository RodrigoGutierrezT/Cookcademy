//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Rodrigo on 13-03-24.
//

import SwiftUI

struct ModifyRecipeView: View {
    
    @Binding var recipe: Recipe
    
    var body: some View {
        Button("Fill in the recipe with test data.") {
            recipe.mainInformation = MainInformation(name: "test", description: "test", author: "test", category: .breakfast)
            recipe.directions = [Direction(description: "test", isOptional: false)]
            recipe.ingredients = [Ingredient(name: "test", quantity: 1.0, unit: .none)]
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var recipeTest: Recipe = Recipe()
        
        var body: some View {
            ModifyRecipeView(recipe: $recipeTest)
        }
    }
    
    return PreviewWrapper()
}
