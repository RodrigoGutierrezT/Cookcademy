//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Rodrigo on 11-03-24.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
