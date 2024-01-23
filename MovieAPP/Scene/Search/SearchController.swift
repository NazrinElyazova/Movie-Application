//
//  SearchController.swift
//  MovieAPP
//
//  Created by Nazrin on 09.12.23.
//

import UIKit

class SearchController: UIViewController, UITextFieldDelegate {
    
    private let viewModel = SearchViewModel()
    
    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var searchOutletButton: UITextField!
    
    @IBAction func searchTextField(_ sender: Any) {
        print("textimiz: \(searchOutletButton.text ?? "")")
        viewModel.getSearch(searchText: searchOutletButton.text ?? "")
    }
    
    @IBOutlet weak var searchView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchOutletButton.delegate = self
        configureUI()
        configureViewModel()
    }
    func configureUI() {
        title = "Search"
        collection.register(UINib(nibName: "SearchCell", bundle: nil), forCellWithReuseIdentifier: "SearchCell")
    }
    func configureViewModel() {
        guard searchOutletButton.text != nil else {return}
        viewModel.error = {
            errorMessage in
            print("Errooorr: \(errorMessage)")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
extension SearchController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.items.count)
        
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell
        let item = viewModel.items[indexPath.item]
        cell.configure(data: item)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 180)
    }
    
}
