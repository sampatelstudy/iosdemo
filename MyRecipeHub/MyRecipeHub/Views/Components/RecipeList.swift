//
//  RecipeList.swift
//  MyRecipeHub
//
//  Created by Ebrahim on 13/02/23.
//

import SwiftUI

struct RecipeList: View {
    @State var recipes : [Recipe]
    @State var stateview : Bool = false
    @EnvironmentObject var recipeVM : RecipeViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                    .padding(.leading)
                Spacer()
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160),spacing: 15)],spacing: 15) {
                if stateview || !stateview{
                    ForEach(recipes) { recipe in
                        NavigationLink {
                            RecipeView(recipe: recipe)
                        } label: {
                            RecipeCard(recipe: recipe)
                        }
                    }
                }
            }
            .padding(.top)
            .onAppear {
                if recipeVM.isFavView {
                    recipes = recipeVM.favrecipes
                }
                stateview.toggle()
            }
        }
        .padding(.horizontal)
        
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            RecipeList(recipes: Recipe.all)
                .environmentObject(RecipeViewModel())
        }
    }
}


