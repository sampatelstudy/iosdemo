//
//  ContentView.swift
//  MyRecipeHub
//
//  Created by Ebrahim on 13/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Tabbar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeViewModel())
    }
}
