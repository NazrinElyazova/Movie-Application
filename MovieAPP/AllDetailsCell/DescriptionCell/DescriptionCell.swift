//
//  DescriptionCell.swift
//  MovieAPP
//
//  Created by Nazrin on 16.12.23.
//

import UIKit

class DescriptionCell: UICollectionViewCell {
    var data = [Details]()
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(data: [MovieDetailModel]) {
        overviewLabel.text = data.description
    }
}
