//
//  CarDetailViewController.swift
//  AutoChek
//
//  Created by mac on 08/08/2021.
//

import UIKit

class CarDetailViewController: UIViewController {
    var viewModel = CarDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.fetchCarDetail(carId: viewModel.id)
        
    }
}
