//
//  CollectionViewCell.swift
//  AutoChek
//
//  Created by mac on 10/08/2021.
//

import UIKit

class CarDetailCollectionCell: UICollectionViewCell {

    @IBOutlet weak var selectedCarImageView: UIImageView!
    @IBOutlet weak var pageImageLabel: UILabel!
    static let identifier = String(describing: CarDetailCollectionCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: CarDetailCollectionCell.identifier, bundle: nil)
    }
    
    func configure(with model: CarMediaList) {
        guard let imageUrl = URL(string: model.url!) else { return }
        selectedCarImageView.sd_setImage(with: imageUrl)
    }
}
