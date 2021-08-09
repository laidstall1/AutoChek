//
//  ViewController.swift
//  AutoChek
//
//  Created by mac on 07/08/2021.
//

import UIKit

class HomeScreenViewController: UIViewController {

    //  MARK: - Properties
    private let viewModel = HomeScreenViewModel()
    @IBOutlet weak var carCategoriesCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var carListingCollectionView: UICollectionView!
    
    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9685223699, green: 0.9686879516, blue: 0.9685119987, alpha: 1)
        collectionViewSetup()
        fetchCarMake()
        fetchCarListing()
    }

    
    //  MARK: - Helpers
    
    func fetchCarMake() {
        self.viewModel.fetchCarMake {
            DispatchQueue.main.async {
                self.carCategoriesCollectionView.reloadData()
            }
        }
    }
    
    func fetchCarListing() {
        self.viewModel.fetchCarListing {
            DispatchQueue.main.async {
                self.carListingCollectionView.reloadData()
            }
        }
    }
    
    func collectionViewSetup() {
        carCategoriesCollectionView.delegate = self
        carCategoriesCollectionView.dataSource = self
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
        print(viewModel.carCategories.count)
        return collectionView == carCategoriesCollectionView ? viewModel.carCategories.count : viewModel.carListing.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == carCategoriesCollectionView {
            let cell = carCategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: CarCategoryCell.identifier, for: indexPath) as! CarCategoryCell
            cell.configure(with: viewModel.carCategories[indexPath.item])
            return cell
        } else {
            let cell = carListingCollectionView.dequeueReusableCell(withReuseIdentifier: CarListingCell.identifier, for: indexPath) as! CarListingCell
            cell.configure(with: viewModel.carListing[indexPath.item])
            return cell
        }
    }
    
}

//  MARK: - UITableViewDelegate

extension HomeScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == carListingCollectionView {
            return CGSize(width: view.frame.width-136, height: 330)
        } else {
            return CGSize(width: 70, height: 90)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        carListingCollectionView.deselectItem(at: indexPath, animated: true)
        if collectionView == carListingCollectionView {
            let controller = CarDetailViewController()
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
