//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Rodrigo on 22-03-24.
//

import SwiftUI

struct ModifyIngredientsView: View {
    
    @Binding var ingredients: [Ingredient]
    @State var newIngredient = Ingredient()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            let addIngredientView = ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                ingredients.append(ingredient)
                newIngredient = Ingredient()
            }
            if $ingredients.isEmpty {
                Spacer()
                NavigationLink("Add the first ingredient", destination: addIngredientView)
                Spacer()
            } else {
                List {
                    ForEach(ingredients.indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }
                    NavigationLink("Add another ingredient", destination: addIngredientView)
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(listBackgroundColor)
                }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var emptyIngredients = [Ingredient]()
        
        var body: some View {
            NavigationView {
                ModifyIngredientsView(ingredients: $emptyIngredients)
            }
        }
    }
    
    return PreviewWrapper()
}
