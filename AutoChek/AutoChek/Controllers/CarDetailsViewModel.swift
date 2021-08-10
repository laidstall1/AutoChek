//
//  CarDetailsViewModel.swift
//  AutoChek
//
//  Created by mac on 09/08/2021.
//

import Foundation
import Alamofire

class CarDetailsViewModel {
    private var service = CarService()
    var completion: (() -> Void)?
    private var detailData = [CarDetails]()
    var id: String?
    
    func fetchCarDetail(carId: String, completion: @escaping () -> Void) {
        service.fetchCars(endPoint: "/car/\(carId)") { response in
            guard let response = response.data else { return }
            do {
                let json =  try JSONDecoder().decode(CarDetails.self, from: response)
                self.detailData.append(json)
                completion()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
