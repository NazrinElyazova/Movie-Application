//
//  PeopleInfoController.swift
//  MovieAPP
//
//  Created by Nazrin on 22.12.23.
//

import UIKit

// Set username and password
let username = "john"
let password = "1234".data(using: .utf8)!
// Set attributes
let attributes: [String: Any] = [
    kSecClass as String: kSecClassGenericPassword,
    kSecAttrAccount as String: username,
    kSecValueData as String: password,
]

class PeopleInfoController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel: PeopleInfoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
    }
    
    func configureViewModel() {
        viewModel?.getInfoList()
        
        viewModel?.error = {
            errorMessage in
            print("Errorumuz var: \(errorMessage)")
        }
        viewModel?.success = {
            self.collection.reloadData()
        }
    }
    
    func configureUI() {
        title = "People Info"
        collection.register(UINib(nibName: "\(PeopleInfoCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(PeopleInfoCell.self)")
    }
}
extension PeopleInfoController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.infoItems.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PeopleInfoCell.self)", for: indexPath) as! PeopleInfoCell
        if let cast = viewModel?.infoItems[indexPath.item] {
            cell.configure(data: cast)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 350)
    }
}
