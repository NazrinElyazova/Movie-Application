//
//  GenreCell.swift
//  MovieAPP
//
//  Created by Nazrin on 16.12.23.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    var movieItems = [Genre]()
    var detail = [Details]()
    
    @IBOutlet weak var pg13Label: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var imbdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collection.register(UINib(nibName: "\(ActionCell.self)", bundle: nil), forCellWithReuseIdentifier: "ActionCell")
    }
    func configure(data: Details) {
        imbdLabel.text = data.imdbID
        hourLbl.text = "\(data.runtime ?? 0)"
        englishLabel.text = data.originalLanguage
        pg13Label.text = "\(data.popularity ?? 0.0)"
    }
}
extension GenreCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(movieItems.count)
      return  movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ActionCell.self)", for: indexPath) as! ActionCell
        cell.actionLabel.text = movieItems[indexPath.row].name
         
            return cell
     
        }
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 60)
    }

