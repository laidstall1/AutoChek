//
//  Extensions.swift
//  AutoChek
//
//  Created by mac on 08/08/2021.
//

import UIKit
import Alamofire

class HomeScreenViewModel {
    
   var carCategories = [MakeList]()
   var carListing = [CarDetailModel]()
   private let service = HomeScreenService()
    
    func fetchCarMake(completion: @escaping () -> Void) {
        service.fetchCars(endPoint: "/make?popular=true") { response in
            guard let response = response.data else { return }
            do {
                let json = try JSONDecoder().decode(CarMake.self, from: response)
                self.carCategories = json.makeList
                completion()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchCarListing(completion: @escaping () -> Void) {
        service.fetchCars(endPoint: "/car/search") { response in
            guard let response = response.data else { return }
            do {
                let json = try JSONDecoder().decode(CarListingModel.self, from: response)
                self.carListing = json.result
                print(self.carListing)
                completion()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
