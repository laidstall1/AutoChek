//
//  CarDetailTableCell.swift
//  AutoChek
//
//  Created by mac on 10/08/2021.
//

import UIKit

class CarDetailTableCell: UITableViewCell {

    static let identifier = String(describing: CarDetailCollectionCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: CarDetailCollectionCell.identifier, bundle: nil)
    }
}
