//
//  CategorieViewController.swift
//  FirstApp
//
//  Created by Mauche Gauthier on 16/05/2022.
//

import UIKit

class CategorieViewController: UIViewController, UICollectionViewDataSource {
    
    //Elements lié à la vue
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Appel de CategoriesViewModel
    var categoriesViewModel: CategoriesViewModel? = nil
    
    //Appel de Categorie
    var categories = [Categorie]()
    
    //initialise loading display
    let alert:UIAlertController = {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        return alert
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loading start
        self.present(alert, animated: false, completion: nil)
        
        
        //Affichage des catégories en fonction de la taille d'écran
        self.collectionViewLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let screenWidth = UIScreen.main.bounds.size.width
        self.collectionViewLayout.itemSize = CGSize(width: screenWidth/2 - 10, height: screenWidth/2 - 40)
        self.collectionViewLayout.minimumInteritemSpacing = 10
        self.collectionViewLayout.minimumLineSpacing = 10
        
        //Initialisation et appel collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(UINib(nibName: CategorielCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategorielCollectionViewCell.identifier)
        self.collectionView?.frame = view.bounds
        
        //Initialisation et appel categoriesViewModel
        self.categoriesViewModel = CategoriesViewModel()
        self.categoriesViewModel?.categoriesHasChanged = {
            self.categories = (self.categoriesViewModel!.categories)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                //Stop loading
                self.alert.dismiss(animated: false)

            }
        }
    }

    //Compte le nombre d'éléments
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    //Setup des cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell (withReuseIdentifier : CategorielCollectionViewCell.identifier, for: indexPath) as! CategorielCollectionViewCell
            cell.setupCell(nameCategorie: self.categories[indexPath.row].name)
            return cell
    }
}

//Delegate pour le click sur une Categorie
extension CategorieViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categorieSelected = self.categoriesViewModel?.categories[indexPath.row]
        let movieViewController = MovieViewController()
        movieViewController.categorie = categorieSelected
        self.navigationController?.pushViewController(movieViewController, animated: true)
    }
    
}
