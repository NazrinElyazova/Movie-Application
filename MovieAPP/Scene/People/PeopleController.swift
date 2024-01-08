//
//  PeopleController.swift
//  MovieAPP
//
//  Created by Nazrin on 08.12.23.
//

import UIKit

class PeopleController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    private let viewModel = PeopleViewModel()
    
    let refreshControl = UIRefreshControl()
    
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
        
    }
    func configureUI() {
        title = "People"
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        
        collection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
    func configureViewModel() {
        viewModel.getPeopleList()
        viewModel.error = { errorMessage in
            print("Error mesajiniz var: \(errorMessage)")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.items.removeAll()
        collection.reloadData()
        viewModel.getPeopleList()
    }
}
extension PeopleController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        let item = viewModel.items[indexPath.item]
        cell.configure(data: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2-10, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(PeopleInfoController.self)") as! PeopleInfoController
        controller.viewModel = PeopleInfoViewModel(peopleID: viewModel.items[indexPath.item].id ?? 0)
        navigationController?.show(controller, sender: nil)
    }
}
