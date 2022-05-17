//
//  MovieViewModel.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 15/05/2022.
//

import Foundation

class MovieViewModel: ObservableObject {
    
    var idMovie:Int
    
    
    @Published var movie: Movie? = nil
    
    
    
    init(idMovie: Int){
        self.idMovie = idMovie
        self.getOneMovie()
    }
    
    private func getOneMovie(){
        
        
        let url = "https://api.themoviedb.org/3/movie/\(self.idMovie )?api_key=\(APIKEY._API_KEY_)&language=fr-FR"
        let urlTrailer = "https://api.themoviedb.org/3/movie/\(self.idMovie )/videos?api_key=\(APIKEY._API_KEY_)"

        let task = URLSession.shared.dataTask(with: URL(string:url)!, completionHandler: { [self] (data, response, error) in
             if let error = error {
               print("Error with fetching films: \(error)")
               return
             }

             if let data = data,
                let getMovie = try? JSONDecoder().decode(Movie.self, from: data) {
                 
                    let taskTrailer = URLSession.shared.dataTask(with: URL(string:urlTrailer)!, completionHandler: { (dataTrailer, response, error) in
                     
//                        Error
                        if let error = error {
                            print("Error with fetching films: \(error)")
                            return
                        }
                     
                   if let dataTrailer = dataTrailer,
                     let trailers = try? JSONDecoder().decode(ListVideoResponse.self, from: dataTrailer) {
                       let video = trailers.resultsToMovie()
                       var movieData = getMovie
                       movieData.trailer = video
                       
                       DispatchQueue.main.async {
                           self.movie = movieData
                       }
                   }
                 })
                 taskTrailer.resume()
                 
                 
                 
                 
                 
                }
        })
        task.resume()
        
    }
    
}


