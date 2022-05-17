//
//  MovieApiDecode.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 05/04/2022.
//

import Foundation


//struct MovieApiDecode: Decodable{


struct MovieAPIDecode: Decodable {
//    let id: Int?
//    let original_title: String?
//    let title: String?
//    let release_date: String?
//    let poster_path: String?
//    let overview: String?
//
//    func toMovie() -> Movie {
//        return Movie(
//            id: self.id ?? 1,
//            title: self.original_title ?? "Unamed movie",
//            subtitle: self.title ?? "No surname",
//            release_date: "qddsd",
//            length: 0,
//            categorie: nil,
//            overview: self.overview ?? "No overview available",
//            affiche: "hg_large",
//            poster: (((self.poster_path != nil) ? ("https://image.tmdb.org/t/p/w500/"+self.poster_path!) : "https://media.istockphoto.com/vectors/error-page-or-file-not-found-icon-vector-id924949200?k=20&m=924949200&s=170667a&w=0&h=-g01ME1udkojlHCZeoa1UnMkWZZppdIFHEKk6wMvxrs=")),
//            trailer: ""
//        )
//    }

}

struct OneMovieAPIDecode: Decodable {
    let id: Int?
    let original_title: String?
    let title: String?
    let release_date: String?
    let poster_path: String?
    let overview: String?
    let backdrop_path:String?
    let genres: [Genre]
    
//    func toMovie() -> Movie {
////        let allGenre = self.genres.filter{$0.name != nil}
//        return Movie(
//            id: self.id ?? 1,
//            title: self.original_title ?? "Unamed movie",
//            subtitle: self.title ?? "No surname",
//            createdDate: Date(),
//            length: 0,
//            categorie: self.genres,
//            description: self.overview ?? "No overview available",
//            affiche: (((self.backdrop_path != nil) ? ("https://image.tmdb.org/t/p/w500/"+self.backdrop_path!) : "https://media.istockphoto.com/vectors/error-page-or-file-not-found-icon-vector-id924949200?k=20&m=924949200&s=170667a&w=0&h=-g01ME1udkojlHCZeoa1UnMkWZZppdIFHEKk6wMvxrs=")),
//            poster: (((self.poster_path != nil) ? ("https://image.tmdb.org/t/p/w500/"+self.poster_path!) : "https://media.istockphoto.com/vectors/error-page-or-file-not-found-icon-vector-id924949200?k=20&m=924949200&s=170667a&w=0&h=-g01ME1udkojlHCZeoa1UnMkWZZppdIFHEKk6wMvxrs=")),
//            trailer: ""
//        )
//    }

}

//struct Genre: Decodable {
//    let id: Int?
//    let name: String?
//
//}
