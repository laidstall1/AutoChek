//
//  CollectionViewCell.swift
//  AutoChek
//
//  Created by mac on 10/08/2021.
//

import UIKit

class CarDetailCollectionCell: UICollectionViewCell {

    @IBOutlet weak var selectedCarImageView: UIImageView!
    
    static let identifier = String(describing: CarDetailCollectionCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: CarDetailCollectionCell.identifier, bundle: nil)
    }
    
    func configure(with model: CarDetails) {
        guard let imageUrl = URL(string: model.imageUrl) else { return }
        selectedCarImageView.sd_setImage(with: imageUrl)
    }
}
