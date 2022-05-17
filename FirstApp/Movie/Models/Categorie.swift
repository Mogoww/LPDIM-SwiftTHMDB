//
//  Categorie.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 15/05/2022.
//

import Foundation

//List Categorie
struct CategorieResponse: Decodable {
    let genres: [Categorie]
}

//Une catégorie
struct Categorie:Decodable{
    let id: Int
    let name: String
}
