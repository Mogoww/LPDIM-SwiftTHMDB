//
//  ViewModel.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 04/04/2022.
//

import Foundation

class ViewModel: ObservableObject{
    
    
    
    var movie =  Movie(
        title:"L'Âge de glace",
        subtitle: "Les Aventures de Buck Wild",
        createdDate: Date(),
        length:100,
        categorie:["Animation", "Comédie", "Aventure", "Familial"],
        description: "kjfdnv",
        affiche: "kfjnv",
        poster: "kdnjkvn",
        trailer:"https://www.youtube.com/watch?v=3FknYS1ryTw"
    )
    
    func oui(){
        self.movie
        
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM y"
    }
    

    
    
    
}


