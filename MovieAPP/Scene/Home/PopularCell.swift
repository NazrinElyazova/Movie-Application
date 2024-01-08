//
//  PopularCell.swift
//  MovieAPP
//
//  Created by Nazrin on 02.12.23.
//

import UIKit

protocol PopularCellDelegate {
    func movieItemSelection(movieId: Int)
}

class PopularCell: UICollectionViewCell {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var popularLabel: UILabel!
    
    var movies = [MovieResult]()
    
    var didItemSelected: ((Int) -> Void)?
    var delegate: PopularCellDelegate?
    
    override func awakeFromNib() {
        self.collection.register(UINib(nibName: "\(TopImageBottomLabelCell.self)", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
    
    func configure(title: String, movies: [MovieResult]) {
        popularLabel.text = title
        self.movies = movies
        collection.reloadData()
    }
}
extension PopularCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(movies.count)
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TopImageBottomLabelCell.self)", for: indexPath) as! TopImageBottomLabelCell
        cell.configure(data: movies[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 167, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.movieItemSelection(movieId: movies[indexPath.item].id  ?? 0)
    }
    
}
