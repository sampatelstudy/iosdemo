//
//  FavouriteView.swift
//  MyRecipeHub
//
//  Created by Ebrahim on 13/02/23.
//

import SwiftUI

struct FavouriteView: View {
    @EnvironmentObject var recipeVM : RecipeViewModel
    @State var stateview : Bool = false
    var body: some View {
        NavigationView{
            if recipeVM.recipes.count <= 0 {
                Text("You haven't save any recipe to your favourite yet")
                    .navigationTitle("Favourites")
            }else{
                ScrollView{
                    if stateview || !stateview {
                        RecipeList(recipes:recipeVM.favrecipes)
                    }
                }.navigationTitle("Favourites")
            }
        }.navigationViewStyle(.stack)
            .onAppear {
            self.recipeVM.isFavView = true
            stateview.toggle()
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
            .environmentObject(RecipeViewModel())
    }
}
