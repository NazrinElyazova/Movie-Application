//
//  PeopleInfoCell.swift
//  MovieAPP
//
//  Created by Nazrin on 22.12.23.
//

import UIKit


class PeopleInfoCell: UICollectionViewCell {
    
    @IBOutlet weak var overviewInfo: UILabel!
    @IBOutlet weak var titleInfo: UILabel!
    @IBOutlet weak var imageInfo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(data: Cast) {
        titleInfo.text = data.title
        imageInfo.loadImage(url: data.backdropPath ?? "")
        overviewInfo.text = data.overview
    }
}
