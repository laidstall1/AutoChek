//
//  Extensions.swift
//  AutoChek
//
//  Created by mac on 08/08/2021.
//

import UIKit
import Alamofire

class HomeScreenViewModel {
    
   var data = [MakeList]()
   private let service = HomeScreenService()
    
    func fetchCarMake(completion: @escaping () -> Void) {
        service.fetchCars(endPoint: "/make?popular=true") { response in
            guard let response = response.data else { return }
            do {
                let json = try JSONDecoder().decode(CarModel.self, from: response)
                self.data = json.makeList
                completion()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
