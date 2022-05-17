//
//  ListVideoAPIDecode.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 10/05/2022.
//

import Foundation
struct ListVideoAPIDecode: Decodable {
    
        let id: Int?
        let results: [VideoAPIDecode]
    
    
    func resultsToMovie() -> Video{
        if let firstVideo = self.results.first(where: { $0.site == Video._SITE_YOUTUBE_ && $0.type == Video._TYPE_TRAILER_ }) {
            return firstVideo.toVideo()
        }
        
        if let firstVideoYoutube = self.results.first(where: { $0.site == Video._SITE_YOUTUBE_}) {
            return firstVideoYoutube.toVideo()
        }
        
        return self.results[0].toVideo()
    }
    
}
