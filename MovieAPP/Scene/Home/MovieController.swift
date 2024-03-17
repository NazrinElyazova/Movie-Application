//
//  MovieController.swift
//  MovieAPP
//
//  Created by Nazrin on 02.12.23.
//

import UIKit


class MovieController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    @IBOutlet weak var libraryButton: UIBarButtonItem!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
    }
    func configureUI() {
        title = "Movies"
        
        collection.register(UINib(nibName: "PopularCell", bundle: nil), forCellWithReuseIdentifier: "PopularCell")
    }
    func configureViewModel() {
        viewModel.getItems()
        viewModel.error = { errorMessage in
            print("Error mesajiniz var: \(errorMessage)")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SearchController") as! SearchController
        navigationController?.show(controller, sender: nil)
    }
    func showMovieDetail(movieId: Int) {
        let coordinator = MovieDetailCoordinator(movieId: movieId, navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
}

// MARK: Collection Configuration
extension MovieController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCell
        let item = viewModel.items[indexPath.item]
        cell.delegate = self
        
        //Closure ile yazmaq istesek
        
        //        cell.didItemSelected = { movieId in
        //            self.showMovieDetail(movieId: movieId)
        //        }
        
        cell.configure(title: item.title, movies: item.movies)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 288)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
// MARK: PopularCellDelegate

extension MovieController: PopularCellDelegate {
    func movieItemSelection(movieId: Int) {
        showMovieDetail(movieId: movieId)
    }
}
