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
        fetchCarDetailListener()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        fetchCarDetailListener()
    }
    
    //  MARK: - Selectors
    @IBAction func handleButtonPressed(_ sender: Any) {
    }
    
    //  MARK: - Helpers
    func fetchCarMediaListener() {
        showLoader(true)
        viewModel.fetchCarMedia(carId: self.viewModel.id!)
            viewModel.completion = {
                self.detailCollectionView.reloadData()
        }
        showLoader(false)
    }
    
    func fetchCarDetailListener() {
        DispatchQueue.main.async {
            self.viewModel.fetchCarDetail(carId: self.viewModel.id!) { [weak self] in
                self?.detailCollectionView.reloadData()
                self?.carNameDetails.text = "\(self?.viewModel.carDetailData[0].year ?? 0) \(self?.viewModel.carDetailData[0].model.make.name ?? "") \(self?.viewModel.carDetailData[0].model.name ?? "Car Name")"
                self?.carMilage.text = "\(self?.viewModel.carDetailData[0].mileage ?? 0)"
                self?.carLocation.text = "\(self!.viewModel.carDetailData[0].city)"
                self?.carStatus.text = "\(self!.viewModel.carDetailData[0].sellingCondition)"
                self?.carPrice.text = "₦\(self!.viewModel.carDetailData[0].marketplacePrice)"
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
        carNameDetails.text = nil
        carMilage.text = nil
        carLocation.text = nil
        carPrice.text = nil
        carStatus.text = nil
        engineTypeLabel.text = nil
        interiorColorLabel.text = nil
        exteriorColorLabel.text = nil
        vin.text = nil
        carID.text = nil
        transmission.text = nil
        fuelType.text = nil
    }
}
    //  MARK: - UICollectionViewDataSource
extension CarDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.carMediaData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarDetailCollectionCell.identifier, for: indexPath) as! CarDetailCollectionCell
        cell.pageImageLabel.text = "\(indexPath.item+1) of \(viewModel.carMediaData.count)"
        cell.configure(with: viewModel.carMediaData[indexPath.item])
            return cell
    }
}
