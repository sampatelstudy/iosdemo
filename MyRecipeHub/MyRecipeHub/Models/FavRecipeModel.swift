//
//  FavRecipeModel.swift
//  MyRecipeHub
//
//  Created by Ebrahim on 14/02/23.
//

import Foundation

struct FavRecipeModel : Identifiable , Codable{
    let id: String
    let name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
    
}
