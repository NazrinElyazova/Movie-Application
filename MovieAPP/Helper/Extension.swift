//
//  Extension.swift
//  MovieAPP
//
//  Created by Nazrin on 08.12.23.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(url: String) {
        let path = "\(NetworkHelper.imagePath)\(url)"
        if let finalUrl = URL(string: path) {
            self.kf.setImage(with: finalUrl)
        }
    }
}
