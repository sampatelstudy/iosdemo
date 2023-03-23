//
//  CategoryView.swift
//  MyRecipeHub
//
//  Created by Ebrahim on 13/02/23.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipeVM : RecipeViewModel
    var category : Category
    var recipes : [Recipe]  {
        return recipeVM.recipes.filter{$0.category == category.rawValue}
    }
    var body: some View {
        ScrollView{
            RecipeList(recipes:recipes)
        }
        .navigationTitle(category.rawValue+"s")
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category.main)
            .environmentObject(RecipeViewModel())
    }
}
