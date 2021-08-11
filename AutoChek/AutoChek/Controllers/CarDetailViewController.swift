//
//  CarDetailViewController.swift
//  AutoChek
//
//  Created by mac on 08/08/2021.
//

import UIKit

class CarDetailViewController: UIViewController {
    //  MARK: - Properties
    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var carNameDetails: UILabel!
    @IBOutlet weak var carMilage: UILabel!
    @IBOutlet weak var carLocation: UILabel!
    @IBOutlet weak var carStatus: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var engineTypeLabel: UILabel!
    @IBOutlet weak var interiorColorLabel: UILabel!
    @IBOutlet weak var exteriorColorLabel: UILabel!
    @IBOutlet weak var vin: UILabel!
    @IBOutlet weak var carID: UILabel!
    @IBOutlet weak var transmission: UILabel!
    @IBOutlet weak var fuelType: UILabel!
    @IBOutlet weak var buyCarButton: UIButton!
    
    var viewModel = CarDetailsViewModel()
    
    //  MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCollectionView()
        fetchCarDetailListener()
        fetchCarMediaListener()
        configureUI()
        buyCarButton.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    //  MARK: - Selectors
    @IBAction func handleButtonPressed(_ sender: Any) {
    }
    
    //  MARK: - Helpers
    func fetchCarMediaListener() {
        viewModel.fetchCarMedia(carId: self.viewModel.id!)
            viewModel.completion = {
                self.detailCollectionView.reloadData()
                print("result: \(self.viewModel.carMediaData )")
        }
    }
    
    func fetchCarDetailListener() {
        DispatchQueue.main.async {
            self.viewModel.fetchCarDetail(carId: self.viewModel.id!) { [weak self] in
                self?.detailCollectionView.reloadData()
                print("\(self!.viewModel.carDetailData )")
                self?.carNameDetails.text = "\(self?.viewModel.carDetailData[0].model.name ?? "Car Name")"
                self?.carMilage.text = "\(self?.viewModel.carDetailData[0].mileage ?? 0)"
                self?.carLocation.text = "\(self!.viewModel.carDetailData[0].city)"
                self?.carStatus.text = "\(self!.viewModel.carDetailData[0].sellingCondition)"
                self?.carPrice.text = "\(self!.viewModel.carDetailData[0].marketplacePrice)"
                self?.engineTypeLabel.text = "\(self!.viewModel.carDetailData[0].engineType)"
                self?.interiorColorLabel.text = "\(self!.viewModel.carDetailData[0].interiorColor)"
                self?.exteriorColorLabel.text = "\(self!.viewModel.carDetailData[0].exteriorColor)"
                self?.vin.text = "\(self!.viewModel.carDetailData[0].vin)"
                self?.carID.text = "\(self!.viewModel.carDetailData[0].id)"
                self?.transmission.text = "\(self!.viewModel.carDetailData[0].transmission)"
                self?.fuelType.text = "\(self!.viewModel.carDetailData[0].fuelType)"
            }
        }
    }
    
    func configureCollectionView() {
        detailCollectionView.dataSource = self
        detailCollectionView.register(CarDetailCollectionCell.nib(), forCellWithReuseIdentifier: CarDetailCollectionCell.identifier)
    }
    
    func configureUI() {
        print(viewModel.carDetailData)
    }
}
    //  MARK: - UICollectionViewDataSource
extension CarDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("counttt\(viewModel.carDetailData.count)")
        return viewModel.carDetailData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarDetailCollectionCell.identifier, for: indexPath) as! CarDetailCollectionCell
        cell.configure(with: viewModel.carDetailData[indexPath.item])
            return cell
    }
}
