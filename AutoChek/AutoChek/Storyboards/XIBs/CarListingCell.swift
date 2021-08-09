//
//  HomeScreenCategoriesCell.swift
//  AutoChek
//
//  Created by mac on 08/08/2021.
//

import UIKit

class CarListingCell: UICollectionViewCell {

    //    MARK: - Properties
    
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var carMake: UILabel!
    @IBOutlet weak var carImageContainerView: UIView!
    @IBOutlet weak var backgroundContainerView: UIView!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var likeCarButton: UIButton!
    @IBOutlet weak var addCarButton: UIButton!
    
    static var identifier = String(describing: CarListingCell.self)
    
    //    MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundContainerView.layer.cornerRadius = 20
        carImageContainerView.layer.cornerRadius = 20
    }

    static func nib() -> UINib {
        return UINib(nibName: CarListingCell.identifier, bundle: nil)
    }
    
    func configure(with model: CarDetailModel) {
        carName.text = model.title
        carMake.text = "YEAR: \(model.year!)"
        guard let imageUrl = URL(string: model.imageURL!) else { return }
        carImageView.sd_setImage(with: imageUrl)
    }
}
