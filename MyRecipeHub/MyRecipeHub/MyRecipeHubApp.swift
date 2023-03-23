//
//  MyRecipeHubApp.swift
//  MyRecipeHub
//
//  Created by Ebrahim on 13/02/23.
//

import SwiftUI

@main
struct MyRecipeHubApp: App {
    
    @StateObject var recipeViewModel = RecipeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeViewModel)
        }
    }
}
