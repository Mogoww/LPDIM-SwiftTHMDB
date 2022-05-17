//
//  VideoAPIDecode.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 10/05/2022.
//

import Foundation
struct VideoAPIDecode: Decodable {
    let id: String?
    let name: String?
    let key: String?
    let site: String?
    let type: String?
    let official: Bool?
    
    func toVideo() -> Video {
        return Video(            
            id: self.id ?? "1",
            name: self.name ?? "",
            key: self.key ?? "",
            site: self.site ?? "",
            type: self.type ?? "",
            official: self.official ?? false
        )
    }

}
