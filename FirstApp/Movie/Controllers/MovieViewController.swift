//
//  MovieViewController.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 04/04/2022.
//

import UIKit
import SwiftUI


class MovieViewController: UIViewController {
    
    //Elements lié à la vue
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleCategorie: UILabel!
    
    let cellReuseId = "MovieCellReuseId"
    
    //Categorie de la list de film
    var categorie: Categorie?
    
    //Appel viewmodel
    var moviesViewModel: MoviesViewModel? = nil

    //initialise loading display
    let alert:UIAlertController = {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        return alert
    }()
    
    //Initialisation liste Movie
    var movies:[Movie] = []

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loading start
        self.present(alert, animated: false, completion: nil)
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: self.cellReuseId)
        
        //Change le titre de la vue par le nom de la categorie selectionée
        titleCategorie.text = categorie?.name
        
        //Initialisation et appel MoviesViewModel
        self.moviesViewModel = MoviesViewModel()
        moviesViewModel?.categorie = categorie
        self.moviesViewModel?.getMovies {
            self.movies = self.moviesViewModel!.movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.alert.dismiss(animated: false)
            }
        }
    }

    //Change le nom du retour
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = "Catégories"
        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
    }
}
        


extension MovieViewController: UITableViewDataSource{
    //Compte le nombre d'éléments
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    //Setup des cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellReuseId,for: indexPath) as! MovieTableViewCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/y"
        
        cell.setupCell(
            image: self.movies[indexPath.row].posterURL,
            title:self.movies[indexPath.row].title,
            subtitle: self.movies[indexPath.row].original_title,
            date:self.movies[indexPath.row].createdDateMovie,
            description: self.movies[indexPath.row].overview
        )
        return cell
    }
    
    
    
}

//Delegate pour le click sur un film 
extension MovieViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie = self.movies[indexPath.row]
        let swiftUIView = MovieDetailView(movieViewModel:MovieViewModel(idMovie: movie.id))
        let hostVC = UIHostingController(rootView: swiftUIView)
        self.navigationController?.pushViewController(hostVC, animated: true)
    }
}

