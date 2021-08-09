//
//  CarCategoriesCell.swift
//  AutoChek
//
//  Created by mac on 08/08/2021.
//

import UIKit
import SDWebImage

class CarCategoryCell: UICollectionViewCell {
    
    //    MARK: - Properties
    
    @IBOutlet weak var carCategoryContainerView: UIView!
    @IBOutlet weak var carCategoryImageView: UIImageView!
    @IBOutlet weak var carCategoryName: UILabel!
    
    static var identifier = String(describing: CarCategoryCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carCategoryContainerView.layer.cornerRadius = carCategoryContainerView.frame.height / 2
        carCategoryName.numberOfLines = 0
    }
    
    static func nib() -> UINib {
        return UINib(nibName: CarCategoryCell.identifier, bundle: nil)
    }
    
    func configure(with model: MakeList) {
        carCategoryName.text = model.name
        print(carCategoryName.text!)
        guard let imageUrl = URL(string: model.imageURL) else {return }
        carCategoryImageView.sd_setImage(with: imageUrl)
    }
}
