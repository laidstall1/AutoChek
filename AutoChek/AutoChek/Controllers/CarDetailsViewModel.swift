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
    var carDetailData = [CarDetails]()
    var carMediaData = [CarMediaList]()
    var id: String?
    
    func fetchCarDetail(carId: String, completion: @escaping () -> Void) {
        service.fetchCars(endPoint: "/car/\(carId)") { response in
            guard let response = response.data else { return }
            do {
                let json =  try JSONDecoder().decode(CarDetails.self, from: response)
                self.carDetailData.append(json)
                completion()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchCarMedia(carId: String) {
        service.fetchCars(endPoint: "/car_media?carId=\(carId)") { response in
            guard let response = response.data else { return }
            do {
                let json =  try JSONDecoder().decode(CarModel.self, from: response)
                self.carMediaData = json.carMediaList!
                self.completion!()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
