//
//  TopImageBottomLabelCell.swift
//  MovieAPP
//
//  Created by Nazrin on 08.12.23.
//

import UIKit

protocol TopImageBottomLabelProtocol {
    var titleText: String {get}
    var imagePath: String {get}
}

class TopImageBottomLabelCell: UICollectionViewCell {
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topImage.layer.cornerRadius = 16
        
    }
    func configure(data: MovieResult) {
        titleLabel.text = data.titleText
        topImage.loadImage(url: data.imagePath)
    }
    
    func configure(data: PeopleData) {
        titleLabel.text = data.titleText
        topImage.loadImage(url: data.imagePath)
    }
}
