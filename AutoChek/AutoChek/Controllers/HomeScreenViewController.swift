//
//  ViewController.swift
//  AutoChek
//
//  Created by mac on 07/08/2021.
//

import UIKit

class HomeScreenViewController: UIViewController {

    //  MARK: - Properties
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var carCategoriesCollectionView: UICollectionView!
    @IBOutlet weak var carListingCollectionView: UICollectionView!
    
    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
    }
    
    //  MARK: - Helpers
    
    func collectionViewSetup() {
        carCategoriesCollectionView.delegate = self
        carCategoriesCollectionView.dataSource = self
        carListingCollectionView.delegate = self
        carListingCollectionView.dataSource = self
    }
}

    //  MARK: - UITableViewDataSource

extension HomeScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}

//  MARK: - UITableViewDelegate

extension HomeScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
}
