//
//  ViewController.swift
//  AutoChek
//
//  Created by mac on 07/08/2021.
//

import UIKit

class HomeScreenViewController: UIViewController {

    //  MARK: - Properties
    @IBOutlet weak var carCategoriesCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var carListingCollectionView: UICollectionView!
    
    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9685223699, green: 0.9686879516, blue: 0.9685119987, alpha: 1)
        collectionViewSetup()
    }
    
    //  MARK: - Helpers
    
    func collectionViewSetup() {
        carCategoriesCollectionView.delegate = self
        carCategoriesCollectionView.dataSource = self
        carListingCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        carListingCollectionView.delegate = self
        carListingCollectionView.dataSource = self
        carListingCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        carListingCollectionView.register(CarListingCell.nib(), forCellWithReuseIdentifier: CarListingCell.identifier)
        carCategoriesCollectionView.register(CarCategoryCell.nib(), forCellWithReuseIdentifier: CarCategoryCell.identifier)
    }
}

    //  MARK: - UITableViewDataSource

extension HomeScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == carCategoriesCollectionView ? 10 : 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == carCategoriesCollectionView {
            let cell = carCategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: CarCategoryCell.identifier, for: indexPath) as! CarCategoryCell
            return cell
        } else {
            let cell = carListingCollectionView.dequeueReusableCell(withReuseIdentifier: CarListingCell.identifier, for: indexPath) as! CarListingCell
            return cell
        }
    }
    
}

//  MARK: - UITableViewDelegate

extension HomeScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(view.frame.width-136)
        return CGSize(width: view.frame.width-136, height: 330)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        carListingCollectionView.deselectItem(at: indexPath, animated: true)
        if collectionView == carListingCollectionView {
            let controller = CarDetailViewController()
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

