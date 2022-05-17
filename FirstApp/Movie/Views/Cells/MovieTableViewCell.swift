//
//  MovieTableViewCell.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 04/04/2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    //Elements lié à la vue
    @IBOutlet var descriptionMovieTable: UILabel!
    @IBOutlet var dateMovieTable: UILabel!
    @IBOutlet var subtitleMovieTable: UILabel!
    @IBOutlet var titleMovieTable: UILabel!
    @IBOutlet var imageMovieTable: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageMovieTable.image = UIImage(named: "empty")
//        ici que l'on va  reset les valeurs
    }
    
    //Setup d'une cellule
    func setupCell(image:String, title:String,subtitle: String, date: String, description: String){
        titleMovieTable.text = title
        subtitleMovieTable.text = subtitle
        dateMovieTable.text = date
        descriptionMovieTable.text = description
        if let url = URL(string: image ){
            imageMovieTable.load(url: url , placeholder: UIImage())
        }
    }
}
