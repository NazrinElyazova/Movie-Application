//
//  SearchCell.swift
//  MovieAPP
//
//  Created by Nazrin on 09.12.23.
//

import UIKit

class SearchCell: UICollectionViewCell {
    var search = [Search]()
    
    
    @IBOutlet weak var nameLabelSearch: UILabel!
    
    @IBOutlet weak var imbdLabelSearch: UILabel!
    @IBOutlet weak var descriptionLabelSearch: UILabel!
    @IBOutlet weak var searchView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configure(data: SearchResult) {
        self.imbdLabelSearch.text = "\(data.voteAverage ?? 0.0) / 10 IMBD"
        self.searchView.loadImage(url: data.posterPath ?? "")
        self.descriptionLabelSearch.text = data.overview 
        self.nameLabelSearch.text = data.originalTitle
        
    }
}
