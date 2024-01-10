//
//  ActionCell.swift
//  MovieAPP
//
//  Created by Nazrin on 18.12.23.
//

import UIKit

class ActionCell: UICollectionViewCell {
//    var data = [Details]()
   
//    var genre = [Genre]()
    
    @IBOutlet weak var actionLabel: UILabel!
  
//    func configure(index: String, data: [Genre]) {
//        actionLabel.text = index
//        self.genre = data
//    }
    func configureAction(data: Genre) {
        actionLabel.text = data.name
    }
}
