//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Rodrigo on 21-03-24.
//

import SwiftUI

struct ModifyMainInformationView: View {
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Binding var mainInformation: MainInformation
    
    var body: some View {
        Form() {
            TextField("Recipe Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
            Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
                    .listRowBackground(listBackgroundColor)
            }
            Picker(selection: $mainInformation.category, label:
                    HStack {
                Text("Category")
                Spacer()
            }) {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    Text(category.rawValue)
                }
            }
            .listRowBackground(listBackgroundColor)
            .pickerStyle(MenuPickerStyle())
        }
        .foregroundColor(listTextColor)
    }
}

#Preview {
    struct PreviewWrapper: View {
        
        @State var mainInformation: MainInformation = Recipe().mainInformation
        
        var body: some View {
            ModifyMainInformationView(mainInformation: $mainInformation)
        }
    }
    
    return PreviewWrapper()
}
