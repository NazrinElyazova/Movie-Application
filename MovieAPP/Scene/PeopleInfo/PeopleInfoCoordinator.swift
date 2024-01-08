//
//  PeopleInfoCoordinator.swift
//  MovieAPP
//
//  Created by Nazrin on 22.12.23.
//

import Foundation
import UIKit

class PeopleInfoCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var peopleId: Int
    
    init(navigationController: UINavigationController, peopleId: Int) {
        self.navigationController = navigationController
        self.peopleId = peopleId
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(PeopleInfoController.self)") as! PeopleInfoController
        controller.viewModel = PeopleInfoViewModel(peopleID: peopleId)
        navigationController.show(controller, sender: nil)
        
    }
}
