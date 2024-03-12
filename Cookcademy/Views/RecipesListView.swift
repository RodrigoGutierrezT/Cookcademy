//
//  ContentView.swift
//  Cookcademy
//
//  Created by Rodrigo on 09-03-24.
//

import SwiftUI

struct RecipesListView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.mainInformation.name,
                        destination: RecipeDetailView(recipe: recipe))
                }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            }
            .navigationTitle(navigationTitle)
        }
    }
}

extension RecipesListView {
    
    private var recipes: [Recipe] {
        recipeData.recipesByCategory(for: category)
      }

    
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}

#Preview {
    NavigationView {
        RecipesListView(category: .breakfast)
            .environmentObject(RecipeData())
    }
}
