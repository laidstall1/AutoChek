//
//  CarDetailsViewModel.swift
//  AutoChek
//
//  Created by mac on 09/08/2021.
//

import Foundation
import SwiftyJSON

class CarDetailsViewModel {
    
    var id = ""
    var comp: (() -> Void)?

    private let service = HomeScreenService()
    
    func fetchCarDetail(carId: String) {
        service.fetchCars(endPoint: "/car/\(carId)") { response in
            guard let response = response.data else { return }
            do {
                let json =  try JSON(data: response)
                
                let result = json["price"].int
                let results = json["year"].int
                print(result, results)

            } catch {
                print(error.localizedDescription)
            }
        }
        self.comp?()
    }
}
