//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Rodrigo on 22-03-24.
//

import SwiftUI

struct ModifyIngredientView: View {
    
    @Binding var ingredient: Ingredient
    let createAction: ((Ingredient) -> Void)
    
    @Environment(\.presentationMode) private var mode
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            Form {
                TextField("Ingredient Name", text: $ingredient.name)
                    .listRowBackground(listBackgroundColor)
                Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                    HStack {
                        Text("Quantity")
                        TextField("Quantity", value: $ingredient.quantity, formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }.listRowBackground(listBackgroundColor)
                Picker(selection: $ingredient.unit, label:
                    HStack {
                        Text("Unit")
                        Spacer()
                }) {
                    ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .listRowBackground(listBackgroundColor)
                HStack {
                    Spacer()
                    Button("Save") {
                        createAction(ingredient)
                        mode.wrappedValue.dismiss()
                    }
                    Spacer()
                }.listRowBackground(listBackgroundColor)
            }
            .foregroundColor(listTextColor)
        }
    }
}

extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

#Preview {
    struct PreviewWrapper: View {
        
        @State var emptyIngredient = Ingredient()
        var body: some View {
            NavigationView {
                ModifyIngredientView(ingredient: $emptyIngredient) { ingredient in
                    print(ingredient)
                }
            }
        }
    }
    
    return PreviewWrapper()
}
