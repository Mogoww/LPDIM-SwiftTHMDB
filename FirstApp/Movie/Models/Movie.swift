//
//  Movie.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 29/03/2022.
//

import Foundation

//Structure pour la liste de films
struct ListMovieReponse: Decodable{
    let page: Int
    let results: [Movie]
}


//Structure pour un film
struct Movie: Decodable{
    let id: Int
    let title: String
    let original_title: String
    let release_date: String?
    let runtime: Int?
    let genres: [Genre]?
    let overview: String
    let backdrop_path: String?
    let poster_path: String?
    var trailer: String?
    
    //Retourne l'url pour le poster
    var posterURL: String {
        if let path = poster_path{
            return "https://image.tmdb.org/t/p/w500\(path)"
        }
        return "https://cdn2.iconfinder.com/data/icons/documents-and-files-v-2/100/doc-03-512.png"
    }
    
    //Retourne l'url pour le "backdrop"
    var backdropURL: String {
        if let path = backdrop_path{
            return "https://image.tmdb.org/t/p/w500\(path)"
        }
        return "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
    }
    
    //Retourne la date formaté de sortie du film
    var createdDateMovie: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        guard let releaseDate = self.release_date, let date = dateFormatter.date(from: releaseDate) else {
            return "n/a"
        }
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "dd/MM/y"
        return dateFormatter2.string(from: date)
    }
    
    //Retourne la longueur du film xxhxxmin
    var lengthConvert: String {
        let(h,m) = minutesToHoursAndMinutes(self.runtime ?? 0)
        return "\(h)h\(m)min"
    }
    
    //Retourne liste de string des noms des genres
    var genreList: [String]{
        if let genre = self.genres {
            return genre.map{(genre: Genre) -> String in
                genre.name
            }
        }
        return [""]
    }
    

    //fonction poour convertir la longueur du film
    func minutesToHoursAndMinutes(_ minutes: Int) -> (Int , Int) {
        return (minutes / 60, (minutes % 60))
    }
    
}

//Structure pour un Genre
struct Genre: Decodable {
    let name: String
}
