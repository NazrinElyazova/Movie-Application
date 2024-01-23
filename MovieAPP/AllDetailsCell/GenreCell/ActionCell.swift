//
//  ActionCell.swift
//  MovieAPP
//
//  Created by Nazrin on 18.12.23.
//

import UIKit

class ActionCell: UICollectionViewCell {

    
    @IBOutlet weak var actionLabel: UILabel!

    func configureAction(data: Genre) {
        actionLabel.text = data.name
    }
}
