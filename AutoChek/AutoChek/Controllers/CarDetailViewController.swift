//
//  CarDetailViewController.swift
//  AutoChek
//
//  Created by mac on 08/08/2021.
//

import UIKit

class CarDetailViewController: UIViewController {
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    var viewModel = CarDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func viewModelListener() {
        DispatchQueue.main.async {
            self.viewModel.fetchCarDetail(carId: self.viewModel.id!) { [weak self] in
                self?.detailCollectionView.reloadData()
                self?.detailTableView.reloadData()
            }
        }
    }
    
    @IBAction func handleButtonPressed(_ sender: Any) {
    }
    
    
    func ConfigureCollectionView() {
//        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        detailCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        detailCollectionView.register(CarDetailCollectionCell.nib(), forCellWithReuseIdentifier: CarDetailCollectionCell.identifier)
        
    }
    
    func ConfigureTableView() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.register(CarDetailTableCell.nib(), forCellReuseIdentifier: CarDetailTableCell.identifier)
    }
    
}

extension CarDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarDetailCollectionCell.identifier, for: indexPath) as! CarDetailCollectionCell
            return cell
    }
}

extension CarDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailTableCell.identifier, for: indexPath) as! CarDetailTableCell
        return cell
    }
}

extension CarDetailViewController: UITableViewDelegate {
        
}

//  MARK: - UICollectionViewDelegate

//extension CarDetailViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == carListingCollectionView {
//            return CGSize(width: view.frame.width, height: 400)
//    }
//}
