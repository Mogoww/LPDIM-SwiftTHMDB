//
//  CategoriesViewModel.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 15/05/2022.
//

//CategoriesViewModel  View model for categorie

import Foundation

class CategoriesViewModel: ObservableObject {
    
    @Published var categories: [Categorie] = [] {
        didSet {
            self.categoriesHasChanged()
        }
    }
    
    var categoriesHasChanged : (() -> ()) = {}
    
    init() {
        self.getCategories()
    }
    
    private func getCategories() {
        
        //Url des catégories avec comme parametre la langue fr
        guard let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=\(APIKEY._API_KEY_)&language=fr-FR") else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(
            with: url,
            completionHandler:
                { (data, response, error) in
                    
                    //Gestion erreur de l'appel
                    if let error = error {
                      print("Error accessing themoviedb.org: \(error)")
                      return
                    }
                    
                    if let data = data,
                        let getCategories = try? JSONDecoder().decode(CategorieResponse.self, from: data) {
                        self.categories = getCategories.genres
                    }
                }
        )
        task.resume()
    }
}

