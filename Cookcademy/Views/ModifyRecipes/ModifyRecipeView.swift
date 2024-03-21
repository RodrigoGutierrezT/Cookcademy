//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Rodrigo on 13-03-24.
//

import SwiftUI

struct ModifyRecipeView: View {
    
    @Binding var recipe: Recipe
    
    @State private var selection = Selection.main
    
    var body: some View {
        VStack {
            Picker("Select recipe component", selection: $selection) {
                Text("Main Info").tag(Selection.main)
                Text("Ingredients").tag(Selection.ingredients)
                Text("directions").tag(Selection.directions)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            switch selection {
            case .main:
                ModifyMainInformationView(mainInformation: $recipe.mainInformation)
            case .ingredients:
                Text("Ingredients Editor")
            case .directions:
                Text("Directions Editor")
            }
            Spacer()
        }
    }
    
    enum Selection {
        case main
        case ingredients
        case directions
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
