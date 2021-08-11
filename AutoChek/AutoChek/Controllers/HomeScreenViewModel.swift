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
   var filteredCarListing = [CarDetailModel]()
   private let service = CarService()
    var completion: (() -> Void)?
    
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
                self.filteredCarListing = self.carListing
                completion()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func filteredUsers(_ searchText: String) {
        for searchedListing in carListing {
            guard let carName = searchedListing.title?.lowercased() else { return }
            guard let carYear = searchedListing.year else { return }
            let vehicleYear = String(carYear)
            if carName.contains(searchText.lowercased()) || vehicleYear.contains(searchText.lowercased()) {
                filteredCarListing.append(searchedListing)
            }
        }
        self.completion?()
    }

    func beginSearch(for searchText: String) {
        filteredCarListing = []
        searchText.isEmpty ? filteredCarListing = carListing : filteredUsers(searchText)
    }
}
    
