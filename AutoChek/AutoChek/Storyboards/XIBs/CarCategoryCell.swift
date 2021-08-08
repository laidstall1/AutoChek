//
//  CarCategoriesCell.swift
//  AutoChek
//
//  Created by mac on 08/08/2021.
//

import UIKit

class CarCategoryCell: UICollectionViewCell {
    
    //    MARK: - Properties
    @IBOutlet weak var carCategoryImageView: UIView!
    @IBOutlet weak var carCategoryName: UILabel!
    
    static var identifier = String(describing: CarCategoryCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carCategoryImageView.layer.cornerRadius = carCategoryImageView.frame.height / 2
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: CarCategoryCell.identifier, bundle: nil)
    }
    
    func configure() {
        
    }
}
