//
//  NameAndSaveCell.swift
//  MovieAPP
//
//  Created by Nazrin on 16.12.23.
//

import UIKit

class NameAndSaveCell: UICollectionViewCell {
    
    var data = [Details]()

    @IBOutlet weak var movieNameLabel: UILabel!
    @IBAction func bookmarkButton(_ sender: Any) {
        
    }
    
    func configure(title: String, data: [Details]) {
        movieNameLabel.text = title
        self.data = data
    }
}
