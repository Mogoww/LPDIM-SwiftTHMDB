//
//  CategorielCollectionViewCell.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 10/05/2022.
//

import UIKit

class CategorielCollectionViewCell: UICollectionViewCell {
    //Elements lié à la vue
    @IBOutlet var name: UILabel!
    @IBOutlet weak var iconCategorie: UIImageView!
    
    static let identifier = "CategorielCollectionViewCell"
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //Setup d'une cellule
    func setupCell(nameCategorie:String){
        name.text = nameCategorie
        if let image = UIImage(named: nameCategorie){
            iconCategorie.image = image
        }
    }
}

