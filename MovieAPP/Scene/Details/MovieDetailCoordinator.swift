//
//  MovieDetailCoordinator.swift
//  MovieAPP
//
//  Created by Nazrin on 21.12.23.
//

import Foundation
import UIKit

class MovieDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var movieId: Int
    
    init(movieId: Int, navigationController: UINavigationController) {
        self.movieId = movieId
        self.navigationController = navigationController
    }
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(MovieDetailsController.self)") as! MovieDetailsController
        controller.viewModel = DetailsViewModel(movieId: movieId)
        controller.hidesBottomBarWhenPushed = true
        navigationController.show(controller, sender: nil)
    }
}

