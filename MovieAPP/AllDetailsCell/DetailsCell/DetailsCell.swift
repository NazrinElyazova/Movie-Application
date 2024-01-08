//
//  DetailsCell.swift
//  MovieAPP
//
//  Created by Nazrin on 15.12.23.
//

import UIKit

class DetailsCell: UICollectionViewCell {

    @IBOutlet weak var spiderImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }
    
    func configure(data: Details) {
        spiderImage.loadImage(url: data.posterPath ?? "")
    }
}
