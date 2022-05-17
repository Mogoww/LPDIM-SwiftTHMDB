//
//  MovieViewModel.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 05/04/2022.
//

import Foundation


class MoviesViewModel: ObservableObject {
    var categorie: Categorie?
    
    
    @Published var movies: [Movie] = []
    
    public func getMovies(completion: @escaping(()->())){
        
        var url = "https://api.themoviedb.org/3/discover/movie?api_key=\(APIKEY._API_KEY_)&language=fr-FR"
        
        
        if let idCategorie = self.categorie?.id{
            url = "\(url)&with_genres=\(idCategorie)"
        }
        
        
        let task = URLSession.shared.dataTask(with: URL(string:url)!, completionHandler: { [self] (data, response, error) in
             if let error = error {
               print("Error with fetching films: \(error)")
               return
             }
            
             if let data = data,
                let getMovies = try? JSONDecoder().decode(ListMovieReponse.self, from: data) {
                 self.movies = getMovies.results
                 completion()
                }
        })
        task.resume()
        
    }
    
}


