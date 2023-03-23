//
//  RecipeViewModel.swift
//  MyRecipeHub
//
//  Created by Ebrahim on 14/02/23.
//

import Foundation


class RecipeViewModel : ObservableObject{
    @Published  var recipes : [Recipe] = []
    @Published  var favrecipes : [Recipe] = []
    @Published  var isFavView : Bool = false
    let items_key : String = "items_key"
    
    init(){
        recipes = Recipe.all
        filteroutfavrecipe()
    }
    
    func addRecipe(recipe:Recipe){
        recipes.append(recipe)
    }
    
    func getFavRecipeitems() -> [FavRecipeModel]{
        guard
            let data = UserDefaults().data(forKey: items_key),
            let saveditems = try? JSONDecoder().decode([FavRecipeModel].self, from: data)
        else {return [FavRecipeModel]()}
        return saveditems
    }
    
    func saveitems(favRecipe:[FavRecipeModel]){
        if let data = try? JSONEncoder().encode(favRecipe) {
            UserDefaults().set(data, forKey: items_key)
        }
    }
    
    func filteroutfavrecipe(){
        favrecipes.removeAll()
        let favereicpe = self.getFavRecipeitems()
        for item in favereicpe {
            for item2 in recipes {
                if item.name == item2.name{
                    favrecipes.append(item2)
                }
            }
        }
    }
}
