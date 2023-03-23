//
//  CategoriesView.swift
//  MyRecipeHub
//
//  Created by Ebrahim on 13/02/23.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var recipeVM : RecipeViewModel
    var body: some View {
        NavigationView{
            List(content: {
                ForEach(Category.allCases,id: \.self) { category in
                    NavigationLink {
                        CategoryView(category: category)
                    } label: {
                        Text(category.rawValue+"s")
                    }
                }
            })
                .navigationTitle("Categories")
        }.navigationViewStyle(.stack)
            .onAppear {
            self.recipeVM.isFavView = false
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(RecipeViewModel())
    }
}
