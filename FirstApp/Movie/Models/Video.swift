//
//  Video.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 10/05/2022.
//

import Foundation

//List video
struct ListVideoResponse: Decodable {
        let id: Int?
        let results: [Video]
    
    //retourne l'id de la video
    func resultsToMovie() -> String?{
            
        if let firstVideo = self.results.first(where: { video in video.site == Video._SITE_YOUTUBE_ && video.type == Video._TYPE_TRAILER_ }) {
            return "https://www.youtube.com/watch?v=\(firstVideo.key)"
        }
        
        if let firstVideoYoutube = self.results.first(where: { $0.site == Video._SITE_YOUTUBE_}) {
            return "https://www.youtube.com/watch?v=\(firstVideoYoutube.key)" 
        }
        
        return nil
    }
}



//Structure une video
struct Video: Decodable{
    let id: String
    let name: String
    let key: String
    let site: String
    let type: String
    let official: Bool
    
    static let _SITE_YOUTUBE_ = "YouTube"
    static let _TYPE_TRAILER_ = "Trailer"
}
