//
//  MovieDetailsController.swift
//  MovieAPP
//
//  Created by Nazrin on 11.12.23.
//

import UIKit

class MovieDetailsController: UIViewController {
    var viewModel: DetailsViewModel?
    
    
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureXibCells()
        configureViewModel()
    }
    
    func configureViewModel() {
        viewModel?.getDetail()
        viewModel?.error = {
            errorMessage in
            print("Errorrr var: \(errorMessage)")
        }
        viewModel?.success = {
            self.collection.reloadData()
        }
    }
}
extension MovieDetailsController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.movieItems.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = viewModel?.movieItems[indexPath.item]
        
        switch item?.type {
            
        case .poster(let poster):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCell", for: indexPath) as! DetailsCell
            cell.spiderImage.loadImage(url: poster)
            
            return cell
            
        case .title(let title):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NameAndSaveCell", for: indexPath) as! NameAndSaveCell
            cell.movieNameLabel.text = title
            return cell
            
        case .info(let info):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCell
            
            cell.imbdLabel.text = "\(String(describing: info.rating ?? "")) /10 IMBD"
            cell.englishLabel?.text = "\(info.language)"
            if info.length != nil {
                cell.hourLbl?.text = info.length
            }
            if info.rating != nil {
                cell.pg13Label?.text = info.rating
            }
            
            cell.configure(data: info.genres)
            return cell
            
            
        case .description(let description):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
            cell.overviewLabel.text = description
            return cell
            
        case .cast(let cast):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
            cell.titleLabel.text = cast
            
            return cell
            
        case .none:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel?.movieItems[indexPath.item]
        switch item?.type {
            
        case .poster:
            return CGSize(width: Int(collectionView.frame.width) - 32, height: 240)
        case .title:
            return CGSize(width: Int(collectionView.frame.width) - 32, height: 60)
        case .info:
            return CGSize(width: Int(collectionView.frame.width) - 32, height: 250)
        case .description:
            return CGSize(width: Int(collectionView.frame.width) - 32, height: 110)
        case .cast:
            return CGSize(width: Int(collectionView.frame.width) - 32, height: 200)
        case .none:
            break
        }
        return CGSize(width: Int(collectionView.frame.width) - 32, height: 100)
    }
}
extension MovieDetailsController {
    func configureXibCells() {
        title = "Details"
        collection.register(UINib(nibName: "\(DetailsCell.self)", bundle: nil), forCellWithReuseIdentifier: "DetailsCell")
        collection.register(UINib(nibName: "\(NameAndSaveCell.self)", bundle: nil), forCellWithReuseIdentifier: "NameAndSaveCell")
        collection.register(UINib(nibName: "\(GenreCell.self)", bundle: nil), forCellWithReuseIdentifier: "GenreCell")
        collection.register(UINib(nibName: "\(DescriptionCell.self)", bundle: nil), forCellWithReuseIdentifier: "DescriptionCell")
        collection.register(UINib(nibName: "\(TopImageBottomLabelCell.self)", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
        
    }
}
