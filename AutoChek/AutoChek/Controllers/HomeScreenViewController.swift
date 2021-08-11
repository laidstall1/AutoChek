//
//  ViewController.swift
//  AutoChek
//
//  Created by mac on 07/08/2021.
//

import UIKit

class HomeScreenViewController: UIViewController {

    //  MARK: - Properties
    private let searchController = UISearchController()
    private let viewModel = HomeScreenViewModel()
    @IBOutlet weak var carCategoriesCollectionView: UICollectionView!
    @IBOutlet weak var carListingCollectionView: UICollectionView!
    
    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9685223699, green: 0.9686879516, blue: 0.9685119987, alpha: 1)
        ConfigureCollectionView()
        fetchCarMake()
        fetchCarListing()
        configureSearchController()
        viewModel.completion = {
            DispatchQueue.main.async {
                self.carListingCollectionView.reloadData()
            }
        }
    }
    //  MARK: - Selectors
    
    @objc func showMenu() {
    }
    //  MARK: - Helpers
    
    func fetchCarMake() {
        viewModel.fetchCarMake {
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
    
    func ConfigureCollectionView() {
        carCategoriesCollectionView.delegate = self
        carCategoriesCollectionView.dataSource = self
        carListingCollectionView.delegate = self
        carListingCollectionView.dataSource = self
        carListingCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        carListingCollectionView.register(CarListingCell.nib(), forCellWithReuseIdentifier: CarListingCell.identifier)
        carCategoriesCollectionView.register(CarCategoryCell.nib(), forCellWithReuseIdentifier: CarCategoryCell.identifier)
    }
    
    func configureNavBar() {
        let navImage = UIImage(named: "NavMenu")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: navImage, style: .plain, target: self, action: #selector(showMenu))
    }
    
    func configureSearchController() {
        navigationItem.searchController = searchController
        searchController.searchBar.showsCancelButton = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = false
        searchController.searchBar.delegate = self
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = .white
        }
    }
}
    //  MARK: - UICollectionViewDataSource

extension HomeScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == carCategoriesCollectionView ? viewModel.carCategories.count : viewModel.filteredCarListing.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == carCategoriesCollectionView {
            let cell = carCategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: CarCategoryCell.identifier, for: indexPath) as! CarCategoryCell
            cell.configure(with: viewModel.carCategories[indexPath.item])
            return cell
        } else {
            let cell = carListingCollectionView.dequeueReusableCell(withReuseIdentifier: CarListingCell.identifier, for: indexPath) as! CarListingCell
            cell.configure(with: viewModel.filteredCarListing[indexPath.item])
            return cell
        }
    }
}
//  MARK: - UICollectionViewDelegate

extension HomeScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == carListingCollectionView {
            return CGSize(width: 350, height: 400)
        } else {
            return CGSize(width: 64, height: 90)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        carListingCollectionView.deselectItem(at: indexPath, animated: true)
        if collectionView == carListingCollectionView {
            let controller = UIStoryboard(name: "CarDetail", bundle: nil).instantiateViewController(withIdentifier: "carDetail") as! CarDetailViewController
            controller.viewModel.id = viewModel.filteredCarListing[indexPath.row].id!
            navigationController?.pushViewController(controller, animated: true)
        } else {
                carCategoriesCollectionView.deselectItem(at: indexPath, animated: true)
                let name = self.viewModel.carCategories[indexPath.row].name
                viewModel.beginSearch(for: name)
            }
        }
    }

extension HomeScreenViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            viewModel.beginSearch(for: searchText)
        }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
    }
}
