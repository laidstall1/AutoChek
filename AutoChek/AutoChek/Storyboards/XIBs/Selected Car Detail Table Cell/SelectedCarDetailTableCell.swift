//
//  SelectedCarDetailTableCell.swift
//  AutoChek
//
//  Created by mac on 10/08/2021.
//

import UIKit

class SelectedCarDetailTableCell: UITableViewCell {
    
    static let identifier = String(describing: SelectedCarDetailTableCell.self)
    
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carMilage: UILabel!
    @IBOutlet weak var carLocation: UILabel!
    @IBOutlet weak var carStatus: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: SelectedCarDetailTableCell.identifier, bundle: nil)
    }
    
    func configure(with model: CarDetails) {
        carName.text = "\(model.year) \(model.model.name)"
        carMilage.text = "\(model.mileage)"
        carLocation.text = model.address
        carStatus.text = model.sellingCondition
    }
}
