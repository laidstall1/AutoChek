//
//  HomeScreenCategoriesCell.swift
//  AutoChek
//
//  Created by mac on 08/08/2021.
//

import UIKit

class CarListingCell: UICollectionViewCell {
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var carMake: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var likeCarButton: UIButton!
    @IBOutlet weak var addCarButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
